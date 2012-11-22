Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dromede@gmail.com>) id 1TbKxI-0002Yb-7J
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 01:48:02 +0100
Received: by mail-vb0-f47.google.com with SMTP id e21so5209961vbm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2012 16:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=2GOEn+twbXmEBUWJMXBg/KoUztRg29fgwgAavppQXCQ=;
	b=DgxsoeMYiX2bcUqeRfQewZu52cpObFhpesfp1O1kYLZ9sLCfZRpz0dC0Yby9sgzK7B
	ILDtb+Deu6H6sp128QctaN8qOQsa4bs3jCjwQAt/+b5Vkt0S+uNi+Sj3bptZD1NjV7gn
	3lqGT/4Qn2R3QqlG0ysW8zNgEsKAYeTFftTuuo6smhqUcqEZxy+j4caTiXKulXai7wvK
	5GfNw6MseyvvfZdmgw9QbakMGJ31D6Bdx6yPK0DBRvpnBvWLHjYsXHHcSioskb5Oavvm
	V8FsRMBy6bJC08285W/jVWHdmeOU7kY9MEGxz2ynxL7Rg732S4tiLJXiztV5x40suJfp
	4ZlA==
MIME-Version: 1.0
Received: by 10.52.20.238 with SMTP id q14mr15670373vde.120.1353544422299;
	Wed, 21 Nov 2012 16:33:42 -0800 (PST)
Received: by 10.58.127.225 with HTTP; Wed, 21 Nov 2012 16:33:42 -0800 (PST)
Date: Thu, 22 Nov 2012 01:33:42 +0100
Message-ID: <CAHod+Gc5uO1HsJdaziyEki7vXbPJkEwXe2Zu-OKBhzgXQD47sQ@mail.gmail.com>
From: =?UTF-8?B?TWFya28gS2F0acSH?= <dromede@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-efl] should epdfview really be under meta-efl?
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
X-List-Received-Date: Thu, 22 Nov 2012 00:48:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

epdfview is a pure gtk app, yet it's under meta-efl/efl. Is this on
purpose or did epdfview end up there
due to it's name similarity to epdf ?


