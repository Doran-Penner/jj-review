This is a very quick, dirty, and hacky way to do code review. (Currently more of a proof-of-concept than anything else.) No pushing directly to main --- instead, create a "proposed commit" with `./create-mr.sh` that out for review. (For example, your feature branch will have some changes on it, then the tip will be a merge of main and feat.) That top commit will just have conflict resolution and a descriptiion of the overall change you want to add. Feedback on changes is WIP; they should also be changes, but placing & detecting those changes is difficult.

As I do this more, I'm learning the pain points! For example, merging and pulling is annoying. Things I want:
- check that you can put slashes in your MR name
- forget old version of MR so we don't force-push to the old MR (that would be bad!)
  - this maybe could be solved by server-side push rules
- cool idea stream...
  - can we use the built-in anonymous push stuff?
  - e.g. `jj git push -c --config templates.git_push_bookmark="..."`
  - would probably be unwieldy. Maybe useful for pushing reviews, though
  - make alias of e.g. `jj create-cr` to just the one big jj command, then we get jj's nice errors and can pass in `-r @-` or whatever if we're careful
  - yeah! We can use some inline `push -c` templating for reviews (`"c/f/thename/" ++.change_id.short()`), but (right now) stick with what we have for the actual CR because that should be versioned.
    - if later we decide the CR shouldn't be manually versioned... we can ignore this whole update thing and just push with a special `push -c` template)
      if only we hada way to fetch the old version of a branch from the server. Ah well
  - other random note: you can `jj git fetch "glob:xyz*"` so that should integrate with seeing review and CRs and such

Upon more contemplation, this seems closer and closer to just enhancements of `jj git push -c`, namely
- naming (part of) the pushes manually for human readability
- versioning the pushes for cross-branch comparison
- explicit request and feedback markers
But the biggest contribution is in how you use it: push a change that you want to be "added" (i.e. have `main` advanced to), and all the discussion and feedback uses vcs-native tooling.
