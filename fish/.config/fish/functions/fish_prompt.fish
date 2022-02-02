function _git_branch_name
  echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

# change color depending on the user.
function _user_host
  if [ (id -u) = "0" ];
    echo -n (set_color brred)
  else
    echo -n (set_color brblue)
  end
  echo -n (hostname|cut -d . -f 1)ˇ$USER (set color normal)
end

function fish_prompt
  set fish_greeting
  set -l cyan (set_color "77FFFF")
  set -l yellow (set_color "FFFF77")
  set -l light_red (set_color "FFAAAA")
  set -l blue (set_color "7777FF")
  set -l green (set_color "77FF77")
  set -l light_green (set_color "77FFAA")
  set -l normal (set_color normal)

  #set -l cwd $blue(basename (prompt_pwd))
  set -l cwd $blue(prompt_pwd)

  # output the prompt, left to right:
  # display 'user@host:'
  echo -n -s $green (whoami) @ (hostname|cut -d . -f 1) $normal ":"

  # display the current directory name:
  echo -n -s $cwd $normal

  # show git branch and dirty state, if applicable:
  if [ (_git_branch_name) ]
    set -l git_branch '(' (_git_branch_name) ')'

    if [ (_is_git_dirty) ]
      set git_info $light_red $git_branch
    else
      set git_info $green $git_branch
    end
    echo -n -s '' $git_info $normal
  end

  # terminate with a nice prompt char:
  echo -n -s '$ ' $normal

end
