Return-Path: <parthitce@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id C89DC7DFDA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 16:24:39 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id n25so3919721wmk.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 May 2019 09:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=xjlKSCWRowa9C3OQfnRDRW7y879p+1YIn03wUJfL7AM=;
	b=EShi4RFJgO5DFKCKlteP8KPSpYEeND4z+YqIfLfulTJBOEEjGWbHjEFnrV7MWXeY6J
	3qAWT1hINaEvgiQTHvJMbqwZ1+z5vj7YH0qqOHs2NlVjkL/64DGeIRLIGo4tb/SJ4Ob/
	rDdPja+8PqSl0bJrKBrOeDi9MVX1Tqq9N8OkUFkxzuV4Htp3smSJrT+gglG/ORhJmto2
	yADafWLBdtrW+6p4qPVxkw+ldgOzlX0zeYyIPfU171j9oYfJlTP8iVDBYYdUYykBJzLL
	a3xTVTnOF86m67n8oL8UkPNVlmqfyvxuw8h1vJGrO/qZ+7dtOjOy0sOejGD/5eAQDLxz
	g2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xjlKSCWRowa9C3OQfnRDRW7y879p+1YIn03wUJfL7AM=;
	b=mpOXm3/Jzdvjo0AgUGwYVtusfl4W0Oh4/E7F50EceiHEDcsnCielRC8Czv/F6hA8Ds
	JC4MrmvnslJHcLg65RygwemK0oXg/EkgnNphB3Cxvi2adxvpw7Ci9Roa5mLRxrzcVCXu
	K5NSdsDqYWl4RkoxUV91WDSNU3WmD2Qd4UFSaYQ7Nj/PdVGt8N92uMK4l3FtkpvqjSWf
	RViN540uSfEizEbPGfcdvHVewDIdjN9XPoJqdxTgKGrv0xnmGsCQ9+GUPo7mMboD3YoC
	wr9Pcm2FjSf5rDr1zKhgDJ3n81a/wD9mM9YXRy1WvOGid8itTK94IgSyzhPq8hvN5e57
	l0hg==
X-Gm-Message-State: APjAAAUV0VdiXi8O4bAZWssateFprMjRDYDLpSWmMfY0DKgh/u1vLwL7
	97oits2q6Go946JSiJOGuA==
X-Google-Smtp-Source: APXvYqzi8XFIf9Vvi0Zix0DnAF12miUZVslKGHLqO/oITP6cS2b3WOlbBPgVJRUiGePwd3TNC+GfVw==
X-Received: by 2002:a7b:c5ce:: with SMTP id n14mr3854598wmk.18.1557419080285; 
	Thu, 09 May 2019 09:24:40 -0700 (PDT)
Received: from antares.denx.de ([62.91.23.180])
	by smtp.gmail.com with ESMTPSA id
	h81sm8457322wmf.33.2019.05.09.09.24.39
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 09:24:39 -0700 (PDT)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20190509081557.383974-1-parthitce@gmail.com>
	<845976C0-9771-46A4-927C-429CE67147BB@gmail.com>
From: Parthiban Nallathambi <parthitce@gmail.com>
Message-ID: <18bd4168-41a5-f857-4d23-1f0e7d213aa7@gmail.com>
Date: Thu, 9 May 2019 18:24:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <845976C0-9771-46A4-927C-429CE67147BB@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Parthiban <parthitce@gmail.com>
Subject: Re: [PATCH] python3-tinydb: add version 3.13.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2019 16:24:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello Alex,


On 5/9/19 6:07 PM, Alexander Kanavin wrote:
> Sorru but no. You should not copy native-specific configuration into target directories. The correct way is to depend on target python3, and fix resulting failures.

It's not copying the file into recipes-sysroot, but into native just for
the installation purpose.

Sure, I will add up into python3 and check the resulting failures.

Thanks,
Parthiban N

> 
> Alex
> 
>> On 9 May 2019, at 10.15, Parthiban Nallathambi <parthitce@gmail.com> wrote:
>>
>> Note:
>> Installation expects _sysconfigdata.py in native python DIR,
>> but python3 doesn't have copy for it. Adding the copy in python3
>> recipe breaks other python packages.
>>
>> Patched locally in _prepend specific to tinydb
>>
>> Signed-off-by: Parthiban Nallathambi <parthitce@gmail.com>
>> ---
>> .../recipes-devtools/python/python-tinydb.inc | 20 +++++++++++++++++++
>> .../python/python3-tinydb_3.13.0.bb           |  2 ++
>> 2 files changed, 22 insertions(+)
>> create mode 100644 meta-python/recipes-devtools/python/python-tinydb.inc
>> create mode 100644 meta-python/recipes-devtools/python/python3-tinydb_3.13.0.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python-tinydb.inc b/meta-python/recipes-devtools/python/python-tinydb.inc
>> new file mode 100644
>> index 000000000..f79daa0f2
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-tinydb.inc
>> @@ -0,0 +1,20 @@
>> +SUMMARY = "TinyDB is a lightweight document oriented database"
>> +DESCRIPTION = "\
>> +TinyDB is a lightweight document oriented database optimized for \
>> +your happiness. It's written in pure Python and has no external \
>> +dependencies. The target are small apps that would be blown away \
>> +by a SQL-DB or an external database server."
>> +HOMEPAGE = "https://github.com/msiemens/tinydb"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c03ea0a450e50a3a05d5a746504cb2eb"
>> +
>> +SRC_URI[md5sum] = "2824877e9ecfd9db5b64fdf079819358"
>> +SRC_URI[sha256sum] = "a05c4c81e6e867c4f8a2e51c5236d0d897019aa5e9296f5947455b0bdd3c519d"
>> +
>> +PYPI_PACKAGE = "tinydb"
>> +inherit pypi python3-dir
>> +DEPENDS = "${PYTHON_PN}-pytest-runner-native"
>> +
>> +do_install_prepend() {
>> +    install -m 0644 ${WORKDIR}/recipe-sysroot-native/usr/lib/python-sysconfigdata/_sysconfigdata.py ${WORKDIR}/recipe-sysroot-native/usr/lib/${PYTHON_DIR}
>> +}
>> diff --git a/meta-python/recipes-devtools/python/python3-tinydb_3.13.0.bb b/meta-python/recipes-devtools/python/python3-tinydb_3.13.0.bb
>> new file mode 100644
>> index 000000000..8996b2d44
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-tinydb_3.13.0.bb
>> @@ -0,0 +1,2 @@
>> +inherit setuptools3
>> +require python-tinydb.inc
>> -- 
>> 2.21.0
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

