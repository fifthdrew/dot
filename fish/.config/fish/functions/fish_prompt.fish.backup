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
  set -l cyan (set_color cyan)
  set -l yellow (set_color yellow)
  set -l red (set_color red)
  set -l blue (set_color --bold blue)
  set -l brgreen (set_color --bold brgreen)
  set -l green (set_color green)
  set -l normal (set_color normal)

  # shorten the prompt, but only when it's too long
  set -g fish_prompt_pwd_dir_length 0
  set -l longprompt $USER (prompt_hostname) (prompt_pwd) (__fish_vcs_prompt) $prompt_status
  if test (expr length "$longprompt") -gt $COLUMNS
    set -g fish_prompt_pwd_dir_length 1
  end

  #set -l cwd $blue(basename (prompt_pwd))
  set -l cwd $blue(prompt_pwd)

  # output the prompt, left to right:
  # display 'user@host:'
  echo -n -s $brgreen (whoami) @ (hostname|cut -d . -f 1) $normal ":"

  # display the current directory name:
  echo -n -s $cwd $normal

  # show git branch and dirty state, if applicable:
  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)

    if [ (_is_git_dirty) ]
      set git_info '(' $red $git_branch $normal ')'
    else
      set git_info '(' $green $git_branch $normal ')'
    end
    echo -n -s '' $git_info $normal
  end

  # terminate with a nice prompt char:
  echo -n -s '$ ' $normal

end
