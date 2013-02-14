Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sankar.m@hardcube.in>) id 1U5rJ7-0004yT-7N
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2013 06:24:33 +0100
Received: by mail-wg0-f41.google.com with SMTP id ds1so4820078wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2013 21:08:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:x-originating-ip:date:message-id:subject
	:from:to:content-type:x-gm-message-state;
	bh=njK45FKiYd5aAcAQrd6Pe3uvprJ7uebfYoL2IPBsdXo=;
	b=mBwZDB2SbGtdvYS6ah4CzQnsrUnFu3mVq0jsN/UKiK7ru/JW8FMyyy8Zg3rv1NDh4L
	E1kVKbfKcOU0QtPaLxK78bk8JFrV3544cpfh22dzL+v0ZHv4XI2BpPkXUjZk5/E3UNJt
	86H8fSDArbf0C6hZ2gWcJ1zmC4vaVMpj6B65YHpGXTTr6x5RojQLp1jNuLepePqQkBSx
	MP9pAHzSR56mwK8Z3BuoKnU6/ORR0Wr0hSHBNWjo4IWSuzeoSDzk3q3tbPK9mO2fO6w+
	yOXjwg8Er44F4vNEb/MnjLpTCnzT9ORa1MetJ2o7t3Q0s+Wuf66AHdhnmAnqZHt35ByS
	BfYg==
MIME-Version: 1.0
X-Received: by 10.194.76.237 with SMTP id n13mr42826434wjw.57.1360818507454;
	Wed, 13 Feb 2013 21:08:27 -0800 (PST)
Received: by 10.217.3.136 with HTTP; Wed, 13 Feb 2013 21:08:27 -0800 (PST)
X-Originating-IP: [203.193.158.21]
Date: Thu, 14 Feb 2013 10:38:27 +0530
Message-ID: <CAKSKmM3AKfssEKaJ6ndb5v9On73Yi6WW9b99h6biHtD=8xS6Aw@mail.gmail.com>
From: Sankar H Malarmani <sankar.m@hardcube.in>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmYOZxVsGOZtHlqjoN7RQKNqiWJBr6dzu5FCFfcQ8/kuigT3+YWjDKJlf0YJAx94XWo+gCA
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: gtk errors in openembedded classis build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Feb 2013 05:24:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I'm tryin to build a linux image by using openembedded classic. On giving
the bitbake command I'm getting the following errors.

failed to load "./apple-red.png": Couldn't recognize the image file format
for file './apple-red.png'

ERROR: Function 'do_compile' failed (see
/home/hc/oe/output/work/i686-linux/gtk+-native-2.24.8-r1/temp/log.do_compile.11738
for further information)
ERROR: Task 6157 (virtual:native:/home/hc/oe/stuff/trdx/recipes/gtk+/gtk+_
2.24.8.bb, do_compile) failed with exit code '1'
ERROR: '/home/hc/oe/stuff/openembedded/recipes/eglibc/eglibc_2.12.bb' failed
ERROR:
'virtual:native:/home/hc/oe/stuff/openembedded/recipes/gobject-introspection/
gobject-introspection_1.29.17.bb' failed
ERROR: 'virtual:native:/home/hc/oe/stuff/trdx/recipes/gtk+/gtk+_2.24.8.bb'
failed

I'm a newbie to this openembedded stuffs..
Please guide me to solve this issue.

-- 
Thanks & Regards
*Shaz*

