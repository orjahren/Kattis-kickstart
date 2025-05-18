#!/usr/bin/env bash
# Written in [Amber](https://amber-lang.com/)
# version: 0.4.0-alpha
# date: 2025-05-18 13:50:26
replace__0_v0() {
    local source=$1
    local search=$2
    local replace=$3
    __AF_replace0_v0="${source//${search}/${replace}}";
    return 0
}
replace_regex__2_v0() {
    local source=$1
    local search=$2
    local replace=$3
    local extended=$4
            replace__0_v0 "${search}" "/" "\/";
        __AF_replace0_v0__16_18="${__AF_replace0_v0}";
        search="${__AF_replace0_v0__16_18}"
        replace__0_v0 "${replace}" "/" "\/";
        __AF_replace0_v0__17_19="${__AF_replace0_v0}";
        replace="${__AF_replace0_v0__17_19}"
        if [ ${extended} != 0 ]; then
            # GNU sed versions 4.0 through 4.2 support extended regex syntax,
            # but only via the "-r" option; use that if the version information
            # contains "GNU sed".
             re='\bCopyright\b.+\bFree Software Foundation\b'; [[ $(sed --version 2>/dev/null) =~ $re ]] ;
            __AS=$?
            local flag=$(if [ $(echo $__AS '==' 0 | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then echo "-r"; else echo "-E"; fi)
            __AMBER_VAL_0=$( echo "${source}" | sed "${flag}" -e "s/${search}/${replace}/g" );
            __AS=$?;
            __AF_replace_regex2_v0="${__AMBER_VAL_0}";
            return 0
else
            __AMBER_VAL_1=$( echo "${source}" | sed -e "s/${search}/${replace}/g" );
            __AS=$?;
            __AF_replace_regex2_v0="${__AMBER_VAL_1}";
            return 0
fi
}
split__3_v0() {
    local text=$1
    local delimiter=$2
    __AMBER_ARRAY_2=();
    local result=("${__AMBER_ARRAY_2[@]}")
     IFS="${delimiter}" read -rd '' -a result < <(printf %s "$text") ;
    __AS=$?
    __AF_split3_v0=("${result[@]}");
    return 0
}
join__6_v0() {
    local list=("${!1}")
    local delimiter=$2
    __AMBER_VAL_3=$( IFS="${delimiter}" ; echo "${list[*]}" );
    __AS=$?;
    __AF_join6_v0="${__AMBER_VAL_3}";
    return 0
}
match_regex__17_v0() {
    local source=$1
    local search=$2
    local extended=$3
            replace__0_v0 "${search}" "/" "\/";
        __AF_replace0_v0__130_18="${__AF_replace0_v0}";
        search="${__AF_replace0_v0__130_18}"
        local output=""
        if [ ${extended} != 0 ]; then
            # GNU sed versions 4.0 through 4.2 support extended regex syntax,
            # but only via the "-r" option; use that if the version information
            # contains "GNU sed".
             re='\bCopyright\b.+\bFree Software Foundation\b'; [[ $(sed --version 2>/dev/null) =~ $re ]] ;
            __AS=$?
            local flag=$(if [ $(echo $__AS '==' 0 | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then echo "-r"; else echo "-E"; fi)
            __AMBER_VAL_4=$( echo "${source}" | sed "${flag}" -ne "/${search}/p" );
            __AS=$?;
            output="${__AMBER_VAL_4}"
else
            __AMBER_VAL_5=$( echo "${source}" | sed -ne "/${search}/p" );
            __AS=$?;
            output="${__AMBER_VAL_5}"
fi
        if [ $([ "_${output}" == "_" ]; echo $?) != 0 ]; then
            __AF_match_regex17_v0=1;
            return 0
fi
    __AF_match_regex17_v0=0;
    return 0
}
dir_exists__32_v0() {
    local path=$1
     [ -d "${path}" ] ;
    __AS=$?;
if [ $__AS != 0 ]; then
        __AF_dir_exists32_v0=0;
        return 0
fi
    __AF_dir_exists32_v0=1;
    return 0
}
file_exists__33_v0() {
    local path=$1
     [ -f "${path}" ] ;
    __AS=$?;
if [ $__AS != 0 ]; then
        __AF_file_exists33_v0=0;
        return 0
fi
    __AF_file_exists33_v0=1;
    return 0
}
dir_create__38_v0() {
    local path=$1
    dir_exists__32_v0 "${path}";
    __AF_dir_exists32_v0__52_12="$__AF_dir_exists32_v0";
    if [ $(echo  '!' "$__AF_dir_exists32_v0__52_12" | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then
         mkdir -p "${path}" ;
        __AS=$?
fi
}
escape_non_glob_chars__41_v0() {
    local path=$1
    replace_regex__2_v0 "${path}" "\([^*?/]\)" "\\\\\1" 0;
    __AF_replace_regex2_v0__86_12="${__AF_replace_regex2_v0}";
    __AF_escape_non_glob_chars41_v0="${__AF_replace_regex2_v0__86_12}";
    return 0
}
file_glob_all__42_v0() {
    local paths=("${!1}")
    local combined=""
    if [ $(echo "${#paths[@]}" '==' 1 | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then
        escape_non_glob_chars__41_v0 "${paths[0]}";
        __AF_escape_non_glob_chars41_v0__95_20="${__AF_escape_non_glob_chars41_v0}";
        combined="${__AF_escape_non_glob_chars41_v0__95_20}"
else
        __AMBER_ARRAY_6=();
        local items=("${__AMBER_ARRAY_6[@]}")
        for item in "${paths[@]}"; do
            escape_non_glob_chars__41_v0 "${item}";
            __AF_escape_non_glob_chars41_v0__99_20="${__AF_escape_non_glob_chars41_v0}";
            item="${__AF_escape_non_glob_chars41_v0__99_20}"
            __AMBER_ARRAY_7=("${item}");
            items+=("${__AMBER_ARRAY_7[@]}")
done
        join__6_v0 items[@] " ";
        __AF_join6_v0__102_20="${__AF_join6_v0}";
        combined="${__AF_join6_v0__102_20}"
fi
    __AMBER_VAL_8=$( eval "for file in ${combined}; do [ -e \"\$file\" ] && echo \"\$file\"; done" );
    __AS=$?;
if [ $__AS != 0 ]; then
__AF_file_glob_all42_v0=()
return $__AS
fi;
    local files="${__AMBER_VAL_8}"
    split__3_v0 "${files}" "
";
    __AF_split3_v0__105_12=("${__AF_split3_v0[@]}");
    __AF_file_glob_all42_v0=("${__AF_split3_v0__105_12[@]}");
    return 0
}
file_glob__43_v0() {
    local path=$1
    __AMBER_ARRAY_9=("${path}");
    file_glob_all__42_v0 __AMBER_ARRAY_9[@];
    __AS=$?;
if [ $__AS != 0 ]; then
__AF_file_glob43_v0=()
return $__AS
fi;
    __AF_file_glob_all42_v0__110_12=("${__AF_file_glob_all42_v0[@]}");
    __AF_file_glob43_v0=("${__AF_file_glob_all42_v0__110_12[@]}");
    return 0
}
is_command__93_v0() {
    local command=$1
     [ -x "$(command -v ${command})" ] ;
    __AS=$?;
if [ $__AS != 0 ]; then
        __AF_is_command93_v0=0;
        return 0
fi
    __AF_is_command93_v0=1;
    return 0
}
input_prompt__94_v0() {
    local prompt=$1
     read -p "$prompt" ;
    __AS=$?
    __AF_input_prompt94_v0="$REPLY";
    return 0
}
file_download__140_v0() {
    local url=$1
    local path=$2
    is_command__93_v0 "curl";
    __AF_is_command93_v0__9_9="$__AF_is_command93_v0";
    is_command__93_v0 "wget";
    __AF_is_command93_v0__12_9="$__AF_is_command93_v0";
    is_command__93_v0 "aria2c";
    __AF_is_command93_v0__15_9="$__AF_is_command93_v0";
    if [ "$__AF_is_command93_v0__9_9" != 0 ]; then
         curl -L -o "${path}" "${url}" ;
        __AS=$?
elif [ "$__AF_is_command93_v0__12_9" != 0 ]; then
         wget "${url}" -P "${path}" ;
        __AS=$?
elif [ "$__AF_is_command93_v0__15_9" != 0 ]; then
         aria2c "${url}" -d "${path}" ;
        __AS=$?
else
        __AF_file_download140_v0=0;
        return 0
fi
    __AF_file_download140_v0=1;
    return 0
}
# Global config
__0_output_parent="../akademika/elyse/kattis/"
__1_template_repo="../akademika/elyse/kattis/"
__2_editor_command_symbol="code"
echo "*** Kattis kickstart ***"
dir_exists__32_v0 "${__0_output_parent}";
__AF_dir_exists32_v0__13_8="$__AF_dir_exists32_v0";
if [ $(echo  '!' "$__AF_dir_exists32_v0__13_8" | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then
    echo "Unable to locate output directory. Expected to find ${__0_output_parent}"
    exit 1
fi
dir_exists__32_v0 "${__1_template_repo}";
__AF_dir_exists32_v0__19_8="$__AF_dir_exists32_v0";
if [ $(echo  '!' "$__AF_dir_exists32_v0__19_8" | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then
    echo "Note: Did not locate solution template source. Expected ${__1_template_repo}"
fi
download_samples__143_v0() {
    local keyword=$1
    local folder=$2
    local file_name="samples.zip"
    local url="https://open.kattis.com/problems/${keyword}/file/statement/${file_name}"
    echo "Downloading samples.."
    file_download__140_v0 "${url}" "${folder}/${file_name}";
    __AF_file_download140_v0__28_8="$__AF_file_download140_v0";
    if [ "$__AF_file_download140_v0__28_8" != 0 ]; then
        echo "Done.."
else
        echo "Unable to downlaod samples :("
        exit 1
fi
    echo "Unzipping.."
    # TODO: Use 'file_name' variable here?
    unzip -d ${folder} ${folder}/*zip;
    __AS=$?;
if [ $__AS != 0 ]; then
        echo "Unable to unzip, exiting :("
        exit 1
fi
    echo "Done.."
}
make_problem_folder__144_v0() {
    local keyword=$1
    local target="${keyword}"
    dir_exists__32_v0 "${target}";
    __AF_dir_exists32_v0__46_8="$__AF_dir_exists32_v0";
    if [ "$__AF_dir_exists32_v0__46_8" != 0 ]; then
        echo "Folder already exists..."
else
        dir_create__38_v0 "${target}";
        __AF_dir_create38_v0__49_9="$__AF_dir_create38_v0";
        echo "$__AF_dir_create38_v0__49_9" > /dev/null 2>&1
fi
    __AF_make_problem_folder144_v0="${target}";
    return 0
}
open_editor__145_v0() {
    local command_symbol=$1
    local target_folder=$2
    echo "Opening editor."
    ${command_symbol} ${target_folder};
    __AS=$?;
if [ $__AS != 0 ]; then
        echo "Unable to open editor :("
fi
}
offer_template__146_v0() {
    local templates=("${!1}")
    echo "Your detected templates are ${templates[@]}"
    input_prompt__94_v0 "Which template? >";
    __AF_input_prompt94_v0__63_31="${__AF_input_prompt94_v0}";
    local selected_template="${__AF_input_prompt94_v0__63_31}"
    # linear search for any matchin templates. Assume empty input to mean no template.
    index=0;
for file in "${templates[@]}"; do
        match_regex__17_v0 "${file}" "${selected_template}" 0;
        __AF_match_regex17_v0__66_12="$__AF_match_regex17_v0";
        if [ "$__AF_match_regex17_v0__66_12" != 0 ]; then
            echo "OK, using template ${file}"
            __AF_offer_template146_v0="${file}";
            return 0
fi
    (( index++ )) || true
done
    __AF_offer_template146_v0="";
    return 0
}
get_template_names__147_v0() {
    local template_repo_path=$1
    # NOTE: Will also contain directories. We essentially just filter for files.
    file_glob__43_v0 "${template_repo_path}*";
    __AS=$?;
if [ $__AS != 0 ]; then
        echo "Failed to retrieve files."
fi;
    __AF_file_glob43_v0__76_16=("${__AF_file_glob43_v0[@]}");
    local glob=("${__AF_file_glob43_v0__76_16[@]}")
    __AMBER_ARRAY_10=();
    local probable_templates=("${__AMBER_ARRAY_10[@]}")
    index=0;
for file in "${glob[@]}"; do
        file_exists__33_v0 "${file}";
        __AF_file_exists33_v0__81_8="$__AF_file_exists33_v0";
        if [ "$__AF_file_exists33_v0__81_8" != 0 ]; then
            __AMBER_ARRAY_11=("${file}");
            probable_templates+=("${__AMBER_ARRAY_11[@]}")
fi
    (( index++ )) || true
done
    __AF_get_template_names147_v0=("${probable_templates[@]}");
    return 0
}
initialize_problem__148_v0() {
    local keyword=$1
    make_problem_folder__144_v0 "${keyword}";
    __AF_make_problem_folder144_v0__89_28="${__AF_make_problem_folder144_v0}";
    local problem_folder="${__AF_make_problem_folder144_v0__89_28}"
    download_samples__143_v0 "${keyword}" "${problem_folder}";
    __AF_download_samples143_v0__90_5="$__AF_download_samples143_v0";
    echo "$__AF_download_samples143_v0__90_5" > /dev/null 2>&1
    get_template_names__147_v0 "${__1_template_repo}";
    __AF_get_template_names147_v0__92_23=("${__AF_get_template_names147_v0[@]}");
    local templates=("${__AF_get_template_names147_v0__92_23[@]}")
    offer_template__146_v0 templates[@];
    __AF_offer_template146_v0__93_31="${__AF_offer_template146_v0}";
    local selected_template="${__AF_offer_template146_v0__93_31}"
    file_exists__33_v0 "${selected_template}";
    __AF_file_exists33_v0__94_8="$__AF_file_exists33_v0";
    if [ "$__AF_file_exists33_v0__94_8" != 0 ]; then
        cp ${selected_template} ${problem_folder};
        __AS=$?;
if [ $__AS != 0 ]; then
            echo "Unable to copy template ${selected_template} to target ${problem_folder}."
fi
else
        echo "Not using any template."
fi
    open_editor__145_v0 "${__2_editor_command_symbol}" "${problem_folder}";
    __AF_open_editor145_v0__102_5="$__AF_open_editor145_v0";
    echo "$__AF_open_editor145_v0__102_5" > /dev/null 2>&1
}
input_prompt__94_v0 "Problem code name: >";
__AF_input_prompt94_v0__105_17="${__AF_input_prompt94_v0}";
__3_keyword="${__AF_input_prompt94_v0__105_17}"
# const keyword = "4thought"
echo "Ok, will initialize ${__3_keyword}."
initialize_problem__148_v0 "${__3_keyword}";
__AF_initialize_problem148_v0__108_1="$__AF_initialize_problem148_v0";
echo "$__AF_initialize_problem148_v0__108_1" > /dev/null 2>&1
