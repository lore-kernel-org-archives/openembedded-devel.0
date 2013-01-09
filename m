Received: from mail-vb0-f42.google.com ([209.85.212.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TsklB-0000Kc-0m
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jan 2013 02:47:29 +0100
Received: by mail-vb0-f42.google.com with SMTP id fa15so1088791vbb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jan 2013 17:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=cSxvOAKQe2G8Sea5xNCDn1p2VKlAIP/olHhZYq/ekJE=;
	b=PaYIjUK94+cPn0eXS61vHsN4g8rRQWvWETjVAtkcWblXyILSwdOvE8mYT1NcPGDAKi
	/FlTwBLMR+ziD6e0bn5gxe1JaG8mXJ4gZPDk6eLFpplAtF8jJ0vI2mFdhxWmBuHd0aDP
	vCtTGlehlWo+o56G1RR/bXGOMBIN2aWdoCeax0A+ciDxMmB316TxWxaQv7cBTKE2EizC
	4UIFsRxfIG0XozAou7ZhhEHyb9n3prAQH8YaUDZ87OentsEh9TYv54pa4qTnd2pLuJZ+
	h14dVn/T4CVgudqeCmbDiPLNfeuLk0PiQc/WjF3uRwbjo05OJ2aOprO0Q+q5Apzte8Q9
	CSZA==
MIME-Version: 1.0
Received: by 10.58.34.4 with SMTP id v4mr76893784vei.57.1357695125217; Tue, 08
	Jan 2013 17:32:05 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Tue, 8 Jan 2013 17:32:05 -0800 (PST)
Date: Wed, 9 Jan 2013 02:32:05 +0100
Message-ID: <CALbNGRR9-R-fzEozx+380_rtG-D7OAv45+CM70hb_eRnTa_5wA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Patchwork issues
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
X-List-Received-Date: Wed, 09 Jan 2013 01:47:29 -0000
Content-Type: text/plain; charset=UTF-8

Hi

* seems that [1-2] did not make it into patchwork. Is patchwork down?
* 40743 & 40741 can be marked as superseded/rejected/whatever. The fix
was committed in [3].

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-January/043418.html
[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-January/043419.html
[3] http://cgit.openembedded.org/meta-openembedded/commit/?id=7478b905939713f264b6ffa7962f0723d4d730d3

Andreas


