This is a very quick, dirty, and hacky way to do code review. (Currently more of a proof-of-concept than anything else.) No pushing directly to main --- instead, create a "proposed commit" with `./create-mr.sh` that out for review. (For example, your feature branch will have some changes on it, then the tip will be a merge of main and feat.) That top commit will just have conflict resolution and a descriptiion of the overall change you want to add. Feedback on changes is WIP; they should also be changes, but placing & detecting those changes is difficult.

As I do this more, I'm learning the pain points! For example, merging and pulling is annoying. Things I want:
- standard review bookmark name, e.g. `review/merge/xyz/v1`
- check that you can put slashes in your MR name
- forget old version of MR so we don't force-push to the old MR (that would be bad!)
  - this maybe could be solved by server-side push rules

Next plan is to make the create and update scripts auto-push the new bookmark, because it really should be like that.
