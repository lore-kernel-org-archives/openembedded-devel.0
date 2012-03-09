Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S5xJi-00056o-GG
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Mar 2012 11:44:58 +0100
Received: by iaag37 with SMTP id g37so1914006iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Mar 2012 02:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=WTfVxa0jBoX+ggfZ1A7tef7LvncxA4Gzi98eQtSVq0Y=;
	b=t9jp55/x7nLiguvTJwuw8yx3L6rFh78teRyuqAd6BaW0ofy+LF3TNBsIoNY27lNoQk
	/GYijgnV/1nnqpoPXyhEARWbTzmEcxtRJ2GHFfM9SX+vvBLFvUmhhuGJt5XTsuA0F9M/
	fiS59rm3zgJfShnBTPF5hj57MkkYUufK06xQE8TGmc6VkMvcv/iVUXLiu/2E2UETRCqj
	CdWxm0pn3WvT6+rYcf3EpjcBl9S4GuYDdeAaJqjqmcX5hR+OK2wVfb1PSP+ZHOl8NoUc
	n/aAf2COAC3lGTzgXoe6PmsvfTTlc/kHOg940pTJhbYTtfuRJnKzYLY9qqqEhrAOj668
	bOpA==
MIME-Version: 1.0
Received: by 10.43.45.10 with SMTP id ui10mr2315376icb.32.1331289378888; Fri,
	09 Mar 2012 02:36:18 -0800 (PST)
Received: by 10.42.75.137 with HTTP; Fri, 9 Mar 2012 02:36:18 -0800 (PST)
Date: Fri, 9 Mar 2012 11:36:18 +0100
Message-ID: <CALbNGRQhPdwnDf7Jw0GG9Rx6rzECGAOzbrcwrKDUeU0jjp=4WQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Patchwork hooks seem to miss some commits
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
X-List-Received-Date: Fri, 09 Mar 2012 10:44:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Just FYI: Patches seem to remain at state 'New' in patchwork although
committed. Some examples [1]-[3]

Andreas

[1] http://patches.openembedded.org/patch/22897/
[2] http://patches.openembedded.org/patch/22743/
[3] http://patches.openembedded.org/patch/22893/


