var lang = {"select_pls":"\u8bf7\u9009\u62e9...","select_specs":"\u8bf7\u9009\u62e9\u89c4\u683c","input_quantity":"\u8bf7\u8f93\u5165\u8d2d\u4e70\u6570\u91cf","invalid_quantity":"\u60a8\u8f93\u5165\u7684\u6570\u91cf\u4e0d\u6b63\u786e","loading":"\u52a0\u8f7d\u4e2d...","loading_please":"\u52a0\u8f7d\u4e2d\uff0c\u8bf7\u7a0d\u5019...","confirm":"\u786e\u5b9a","yes":"\u662f","no":"\u5426","error":"\u9519\u8bef","please_confirm":"\u8bf7\u786e\u8ba4","submit":"\u63d0\u4ea4","reset":"\u91cd\u7f6e","display":"\u663e\u793a","hidden":"\u9690\u85cf","handle_successed":"\u64cd\u4f5c\u6210\u529f\u3002","name_exist":"\u6b64\u540d\u79f0\u5df2\u5b58\u5728\uff0c\u8bf7\u60a8\u66f4\u6362\u4e00\u4e2a","editable":"\u53ef\u7f16\u8f91","only_number":"\u6b64\u9879\u4ec5\u80fd\u4e3a\u6570\u5b57","only_int":"\u6b64\u9879\u4ec5\u80fd\u4e3a\u6574\u6570","only_pint":"\u6b64\u9879\u4ec5\u80fd\u4e3a\u6b63\u6574\u6570","not_empty":"\u6b64\u9879\u4e0d\u80fd\u4e3a\u7a7a","small":"\u6b64\u9879\u5e94\u5c0f\u4e8e\u7b49\u4e8e","insert_editor":"\u63d2\u5165\u7f16\u8f91\u5668","drop":"\u5220\u9664","not_allowed_type":"\u60a8\u4e0a\u4f20\u7684\u6b64\u6587\u4ef6\u683c\u5f0f\u4e0d\u6b63\u786e","not_allowed_size":"\u60a8\u4e0a\u4f20\u7684\u6b64\u6587\u4ef6\u5927\u5c0f\u8d85\u8fc7\u4e86\u5141\u8bb8\u503c","space_limit_arrived":"\u5f88\u62b1\u6b49\uff0c\u60a8\u4e0a\u4f20\u7684\u6587\u4ef6\u6240\u5360\u7a7a\u95f4\u5df2\u8fbe\u4e0a\u9650\uff0c\u8bf7\u8054\u7cfbiximo.cc!\u5438\u58a8\u7f51 - \u7535\u5b50\u4e66\u4ea4\u6613\u5e73\u53f0\u7ba1\u7406\u5458\u5347\u7ea7\u5e97\u94fa","no_upload_file":"\u672a\u77e5\u9519\u8bef\uff0c\u670d\u52a1\u5668\u6ca1\u6709\u83b7\u53d6\u5230\u4e0a\u4f20\u7684\u6587\u4ef6\uff0c\u8bf7\u91cd\u8bd5\u6216\u8054\u7cfbiximo.cc!\u5438\u58a8\u7f51 - \u7535\u5b50\u4e66\u4ea4\u6613\u5e73\u53f0\u7ba1\u7406\u5458","file_save_error":"\u6587\u4ef6\u4fdd\u5b58\u5931\u8d25\uff0c\u8bf7\u8054\u7cfbiximo.cc!\u5438\u58a8\u7f51 - \u7535\u5b50\u4e66\u4ea4\u6613\u5e73\u53f0\u7ba1\u7406\u5458","file_add_error":"\u6587\u4ef6\u4fe1\u606f\u5165\u5e93\u9519\u8bef\uff0c\u8bf7\u8054\u7cfbiximo.cc!\u5438\u58a8\u7f51 - \u7535\u5b50\u4e66\u4ea4\u6613\u5e73\u53f0\u7ba1\u7406\u5458\u68c0\u67e5\u9519\u8bef","queue_too_many":"\u4e00\u6b21\u4e0a\u4f20\u6587\u4ef6\u592a\u591a\uff0c\u8bf7\u5c11\u9009\u53d6\u4e00\u4e9b","uploading":"\u6b63\u5728\u4e0a\u4f20...","success":"\u6210\u529f\u3002","finish":"\u5b8c\u6210","cancelled":"\u5df2\u53d6\u6d88","stopped":"\u5df2\u505c\u6b62","insert_album":"\u63d2\u5165\u76f8\u518c","remove_album":"\u79fb\u51fa\u76f8\u518c","uploadedfile_drop_confirm":"\u56fe\u7247\u5220\u9664\u540e\u65e0\u6cd5\u6062\u590d\uff0c\u60a8\u786e\u5b9a\u8981\u5220\u9664\u5417\uff1f","db_no_such_image":"\u8bf7\u5148\u901a\u8fc7\u7b2c\u4e00\u6b65\u5bfc\u5165\u8be5\u56fe\u7247\u5bf9\u5e94\u7684\u5546\u54c1","pending":"\u5c31\u7eea","duplicate_spec_name":"\u6709\u91cd\u590d\u7684\u89c4\u683c\u540d\u79f0","duplicate_spec":"\u60a8\u6709\u91cd\u590d\u7684\u89c4\u683c","spec_not_complate":"\u89c4\u683c\u586b\u5199\u4e0d\u5b8c\u6574","spec_name_required":"\u89c4\u683c\u540d\u79f0\u8bf7\u81f3\u5c11\u586b\u5199\u4e00\u4e2a"};lang.get = function(key){
    eval('var langKey = lang.' + key);
    if(typeof(langKey) == 'undefined'){
        return key;
    }else{
        return langKey;
    }
}