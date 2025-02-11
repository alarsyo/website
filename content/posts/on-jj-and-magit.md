---
title: "On JJ and Magit"
date: 2025-02-11T14:40:00+01:00
draft: true
---

I'm writing this post after having used [Jujutsu](https://jj-vcs.github.io)[^1] for
a few weeks. This is some kind of "experience report", as well as yet another[^2]
love letter to [Magit](https://emacsair.me/2017/09/01/the-magical-git-interface/).

[^1]: If you don't know what `jj` is, this post is not for you (yet!). [I've put
    together a list of great resources to learn about it](#know-more-about-jj)
    
[^2]: This is the first I'm writing about it myself, but you can find [magit
    appreciation](https://endlessparentheses.com/it-s-magit-and-you-re-the-magician.html)
    all over the internet

# My background

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

## Know more about JJ

In case you landed here without knowing what `jj` is, here's a non-exhaustive
list of cool resources about it:

- https://steveklabnik.github.io/jujutsu-tutorial/
- https://v5.chriskrycho.com/essays/jj-init/
- https://v5.chriskrycho.com/journal/jujutsu-megamerges-and-jj-absorb/
- https://kubamartin.com/posts/introduction-to-the-jujutsu-vcs/
- https://ofcr.se/jujutsu-merge-workflow
