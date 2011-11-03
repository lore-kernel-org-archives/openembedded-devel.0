Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mgargela@gmail.com>) id 1RM4i4-0001W9-Op
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Nov 2011 22:20:28 +0100
Received: by gyh4 with SMTP id 4so489847gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2011 14:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=3BQLR04CSDF8NDtAAWajeuJ8ioEQzreXXO/oK8rdnvA=;
	b=AaMju0bWtVcv/6GxkrXhN+OxfEvnbRTH/kWXMQUJlLZDX8C21/+CF5bGeFtLDyRTeI
	hwliyMGUobeqAhyYpJDQJt+rlr8J3sog1M55JafkKSti6/IEwXQ2YM6j/+Gfi4BjKe44
	RkKrHEPR1FaN5hQLijigN/cRFEZrdUvbLJ3xo=
MIME-Version: 1.0
Received: by 10.236.192.132 with SMTP id i4mr15536949yhn.80.1320354397488;
	Thu, 03 Nov 2011 14:06:37 -0700 (PDT)
Sender: mgargela@gmail.com
Received: by 10.236.110.7 with HTTP; Thu, 3 Nov 2011 14:06:37 -0700 (PDT)
Date: Thu, 3 Nov 2011 23:06:37 +0200
X-Google-Sender-Auth: jHLJcITg0DZfe-RIMd4ruzUmczc
Message-ID: <CAObi9r-62Wr8S8aJV0=UvpB9mhP657UBw556w-cpSq9YkCZ7TA@mail.gmail.com>
From: mgundes <mgcse@hotmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: running bb located path info
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
X-List-Received-Date: Thu, 03 Nov 2011 21:20:28 -0000
Content-Type: text/plain; charset=UTF-8

   Hi everyone,

   I need to know is there a variable assigned with running current bb file
path?

   One of freenode #oe friend told me to try THISDIR but It did not work
for me. By the way, I use openembedded classic.

Regards,
Thanks

-- 
MahmutG

