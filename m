Received: from [66.249.92.173] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <nicolasfr@gmail.com>) id 1GuXE2-00075D-Vx
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Dec 2006 17:44:59 +0100
Received: by ug-out-1314.google.com with SMTP id e2so207599ugf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Dec 2006 08:43:13 -0800 (PST)
Received: by 10.78.193.19 with SMTP id q19mr801273huf.1166027759794;
	Wed, 13 Dec 2006 08:35:59 -0800 (PST)
Received: by 10.78.159.1 with HTTP; Wed, 13 Dec 2006 08:35:59 -0800 (PST)
Message-ID: <b9481e140612130835p4c1ba46ja07c53d7cb473092@mail.gmail.com>
Date: Wed, 13 Dec 2006 17:35:59 +0100
From: "Nicolas FR" <nicolasfr@gmail.com>
To: "Using the OpenEmbedded metadata to build Linux Distributions"
	<openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: task-base extra stuff
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Dec 2006 16:44:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

After reading HRW's interesting article:
http://www.hrw.one.pl/2006/12/12/how-to-use-task-base/
I have a question: I made an image for x86 target and used task base.
I understand how to add extra stuff with
MACHINE_EXTRA_RDEPENDS/MACHINE_EXTRA_RRECOMMENDS but is it possible to
do the reverse:

I do not want to pull psplash even if my machine features "screen". Is
it possible? (I tried ASSUME_PROVIDED += psplash in local.conf but
psplash is always added to the rootfs image).

Nicolas.


