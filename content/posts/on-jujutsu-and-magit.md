---
title: "On Jujutsu and Magit"
date: 2025-02-11T14:40:00+01:00
draft: true
---

I'm writing this post after having used [Jujutsu](https://jj-vcs.github.io)[^1] for
a few weeks. This is some kind of "experience report", as well as yet another[^2]
love letter to [Magit](https://emacsair.me/2017/09/01/the-magical-git-interface/).

[^1]: If you don't know what `jj` is, this post is not for you (yet!). [I've put
    together a list of great resources to learn about it](#know-more-about-jj).
    
[^2]: This is the first time I'm writing about it myself, but you can find
    [magit
    appreciation](https://endlessparentheses.com/it-s-magit-and-you-re-the-magician.html)
    all over the internet.

## My background

I think I'd classify myself as a `git` power user. I'm sure I don't know
*everything* about the intricacies about the Git command line interface, but I
*do* know my way around it. I like to believe I am *one of those guys* that
colleagues and friends call for help when their local repo inevitably gets
borked.

Git is the only VCS I've used[^3] since my beginnings as a young ~~warlock
apprentice~~ computer science student, 10 years ago. So although in hindsight
I've come to understand why people criticize its CLI so much, it's always felt
familiar to me, and it's the only way I've known how to do things for a long
time.

[^3]: Okay, it's the only VCS I've used *seriously*. I've read about and maybe
    installed Mercurial once or twice, and I was quite hyped when I tried out
    the first Pijul versions that were released a few years ago, but nothing
    beyond that.
    
In addition to being quite ~~blind~~ used to the quirks of its CLI, my main way
of interacting with `git` has been through Magit, ever since ~~a bearded
wizard~~ [my now PhD advisor](https://www.lrde.epita.fr/~adl/) showed it to me
about 8 years ago. At the time, I was a convinced Vim user. After trying Magit,
I decided it was compelling enough to switch to Emacs[^4] and never looked back.
Yes, Magit is *that good*.

[^4]: With Vim bindings, of course. My pinky fingers are fine, thank you very
    much.


## Discovering JJ

I've been reading about `jj` through blog posts, tutorials, and [its official
documentation](https://jj-vcs.github.io). Everything that I read made me want to
learn more and try it. In no particular order:

- A lot of workflows look simpler than equivalent ones in `git`, so it feels
  like there a more ways to "officially" use it depending on your preferred
  mental model
- I really like the notion of `changeid` being invariant to history
  rewrites[^5]. This leads to forge workflows that are more similar to what
  [Gerrit](https://www.gerritcodereview.com/) or
  [Phabricator](https://secure.phabricator.com/) enable[^7].
- First-class conflicts are awesome! Pijul had them as well.
- The `git` backend is a must, this is what allows using `jj` transparently in
  `git` repos, and switching to `jj` full time without bothering your
  collaborators with your new shiny technology that they don't really want to
  learn about. This "backwards compatibility" is a key feature, and I believe it
  is what makes the difference between a cool experiment, like Pijul, and a real
  path forward.[^6]
- Mega-merges look really handy when working on multiple unrelated features at
  the same time.

[^5]: As opposed to commit ids, which change everytime you rebase a branch or
    amend a commit

[^6]: I think the people working on [Oils](https://oils.pub) would also agree
    here.

[^7]: Workflows which I believe to be superior to the Pull Request model.

So of course I bit the bullet. [A few lines of Nix code
later](https://git.alarsyo.net/alarsyo/nixos-config/commit/ef67f8f25d17fdb574ea6a4cbe1356c77b3b82fb),
I was running my first `jj` commands and following along [Steve Klabnik's
excellent tutorial](https://steveklabnik.github.io/jujutsu-tutorial/). After
finishing that, I decided that I'd try using it in my "real-world" repositories,
and forbid myself from using the `git` binary.

And... that's where things went wrong.

## Magit ruined the CLI experience for me

Yeah. In practice, I feel quite frustrated when using `jj`, not because it feels
worse than `git` (on the contrary, I can confirm what everyone says! It does
feel way better than doing everything with the `git` CLI, it's a net
improvement), but because it feels worse than Magit.

Now, of course a simple CLI cannot really rival with a GUI application. I'm not
saying `jj` on its own *should* feel like Magit for me to even consider it. I'm
saying, I'll need a Magit equivalent before the `jj` experience feels better
than what I currently have. And that's okay! It will happen eventually. In fact,
there is [such a project](https://github.com/bennyandresen/jujutsu.el) being
developed already, which I tried to load into my configuration, but got an error
which I couldn't find a fix for. The creator of the plugin mentions that it is
in "pre-alpha" stage, and that as such, he is not accepting issues or pull
requests. As he states, the plugin is

> inspired by magit and humbly not attempting to match it in scope

So I'll keep an eye on it, though it doesn't seem to have all the features I
need yet. Who knows, maybe once I'm done with my thesis[^9], and the author
opens up PRs, I'll contribute to it?

[^9]: Yep, the one I'm currently procrastinating by writing this blog post
    instead!

Of course there are [other GUI/TUI
options](https://github.com/jj-vcs/jj/wiki/GUI-and-TUI), some of which look
quite usable! But they're far from matching the experience I get within Magit.

## Dreaming of the ideal tool/workflow

One of the things I like to do often when writing code is iterating on the patch
"as I go", incrementally:

1. I write some code, maybe some of it should be part of one commit, maybe some
   of it should be part of another.
2. When I've written enough code for it to execute meaningfully, I build it, run
   the executable or some tests to check on the new expected behaviour, fixing
   it if necessary.
3. Then I stage some of the changes I just made that I think should be part of a
   single commit. But I'm probably not done yet! The feature surely needs more
   polish, so I go back to step 1, write some more code, test it, stage it,
   rinse and repeat.

With the `git` CLI, that process would be painful, as each staging operation
would need a call to `git add -up` and its clunky UI[^10], and each "review"
operation would need calls to `git diff` or `git diff --staged`, depending on if
I want to look at what's staged already or not. Magit makes it a breeze though,
displaying both staged and unstaged changes in its main status buffer, and
allowing to visually select individual lines of hunks for staging. At the press
of a single `s` key I can stage parts of the code I want.

[^10]: I'm complaining about it but I'm glad the option to split up a patch is
    there at all!

Within `git`, this means I'm making heavy use of the distinction between the
working directory and the staging area: some code lives in the working directory
only for a while, maybe because it belongs to another side commit that I'm
planning to complete later. And some code lives in the staging area, where I'm
incrementally building up my patch, reading through it between each iteration to
check how the patch is looking.

Now, one of the fundamental differences in `jj` is that **there is no staging
area**. Your working directory is automatically "staged"/snapshotted with every
`jj` command you run, and there's even [an
option](https://jj-vcs.github.io/jj/v0.26.0/config/#watchman) to snapshot `@`
(your working copy) on every file modification!

Thankfully, there is a way to get an equivalent workflow. If anything, Jujutsu
is more flexible in terms of which workflows it allows. The one I'm using is
called the "`squash`" workflow, because it makes heavy use of the `jj squash`
command. [Steve's tutorial has a whole section about
it](https://steveklabnik.github.io/jujutsu-tutorial/real-world-workflows/the-squash-workflow.html),
so I'm not going to explain how it works in detail, but in a few words, you can
use `jj squash -i` to do the equivalent of `git add -p` and selectively move
some of the changes to the parent[^11] of the working copy. So you have your
working copy `@` which would be the equivalent of `git`'s working directory in
this workflow[^12], then you have the change you're actually building, `@-`, the
parent of your "working directory" change. `git diff` and `git diff --staged`
are replaced by `jj diff` and `jj diff -r @-`[^13] respectively. In practice it
looks like this:

```sh
$ jj
@  ulrxurnn user@mail.net 2025-02-13 12:47:52 ff935950
│  (empty) (no description set) # this is your working copy, no description is needed
○  nlqrkwps user@mail.net 2025-02-13 12:47:36 git_head() f20d4859
│  (no description set) # this is the change you're incrementally building, your "staging area"
◆  klryslqk user@mail.net 2025-02-11 17:24:13 main 62ff2625
│  feat: my awesome change # this change is "finished" for now
```

So `jj` supports what I want, all I'm missing is a great Emacs package that
enables this workflow!

[^11]: It squashes into the working copy's parent by default but you can
    actually squash into any change/commit with `-r my_revision`.

[^12]: Except you get automagic snapshotting of your entire working directory
    for free with `jj`!

[^13]: `-r @-` is a pain to type compared to `--staged`, but I've seen people
    alias it to `jj pdiff` for parent diff.

## Where `jj` still shines

Magit makes a ton of stuff *almost as painless* as they are in `jj`. For
instance, whenever I need to rewrite some commit history, I'll always go for
Magit if that's an option: complex history rewriting operations are available
with a few key strokes, and Magit takes care of building the arcane command line
invocations for you. No more typing `git commit --fixup rev` and `git rebase -i
--autosquash` by hand, and there's even some very handy shortcuts like the
[`magit-commit-instant-fixup`](https://magit.vc/manual/magit.html#index-magit_002dcommit_002dinstant_002dfixup)
command, bound to `F` in the commit menu, that basically run both previous
commands one after the other, avoiding the need to manually rebase to squash the
commit into its relevant change. So all these years I've almost been getting
`jj`'s automatic rebasing for free!

But even Magit can't fix *everyting* about `git`: after all, it's still built
upon it. And if there's one thing where Magit is helpless compared to `jj`, it's
regarding **conflicts**. `jj` has first class conflicts, and doesn't require you
to fix them when they happen: you can delay the resolution indefinitely. That's
not the case in `git`, and sometimes my super duper cool Magit flow gets
interrupted by a pesky conflict that I *have* to fix immediately.

I'm sure there's some other stuff where `jj` is clearly superior, but I
certainly haven't used it enough to know about all of it.

## Conclusion

I guess this post is both a way to point the curious reader at a **new** very
cool VCS, as well as a way to show my appreciation for an *old* tool that I
realize I've taken for granted for the past 8 years.

Forgetting about **my** user interface expectations for a second, I think `jj`
is a massive UI improvement over the `git` CLI. Anyone that is *not* using a
superior GUI can probably benefit from switching to `jj` right now, and I
encourage you to try it!

## Know more about Jujutsu

In case you landed here without knowing what `jj` is, here's a non-exhaustive
list of cool resources about it:

- https://steveklabnik.github.io/jujutsu-tutorial/
- https://v5.chriskrycho.com/essays/jj-init/
- https://v5.chriskrycho.com/journal/jujutsu-megamerges-and-jj-absorb/
- https://kubamartin.com/posts/introduction-to-the-jujutsu-vcs/
- https://ofcr.se/jujutsu-merge-workflow
- https://neugierig.org/software/blog/2024/12/jujutsu.html
- https://justinpombrio.net/2025/02/11/jj-cheat-sheet.html
