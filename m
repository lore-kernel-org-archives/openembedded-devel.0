Received: from mail-la0-f48.google.com ([209.85.215.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TrgWO-0005rR-BD
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 04:03:36 +0100
Received: by mail-la0-f48.google.com with SMTP id ej20so12449171lab.35
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Jan 2013 18:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer;
	bh=VJff+4WOo+6B2BRYNyPFfgR/CWVdYf433elmTzP6FXM=;
	b=YcaJK7wx3WXwCzi7ZcqltR3LyXMjJkZUnboJ0T/QRgIDXSDICNwXScPT9rgxaWY9Z0
	j0QWGSxrzc9hxJ1WORzSWa/9gu4ROTIAAQaiRaxh+pMdTE/GEjyirv42sEDYOGaGa8il
	3XHaPIL1C+KtrrrJrFP9yZm4PI4iKjeAs0wInU3Le/h4eqYuQ+72zenST6d/zTUTFk+D
	PKSq0Jkuw5ZzOeOgyxc1rGpj1iFUWibE0SmBSKiS6R+hCYYIvp+1HWIOBDbArcBPbB9d
	jAEFMfGEdzmDSTG8mtzQW3F9A4dCbm5OcglgrdBqNH3krYOsfil66j6x6dbEjXX1G2nj
	eMjw==
X-Received: by 10.112.29.71 with SMTP id i7mr23118227lbh.85.1357440508892;
	Sat, 05 Jan 2013 18:48:28 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id to7sm17215520lab.13.2013.01.05.18.48.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 05 Jan 2013 18:48:28 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>) id 1TrgHi-0003PG-2R
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 04:48:26 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 04:48:23 +0200
Message-Id: <1357440504-13057-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: gtk+3 update
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
X-List-Received-Date: Sun, 06 Jan 2013 03:03:36 -0000

We now have all the depencies of gtk+3-3.4. Latest version of gtk+3 is 3.6,
but for that we still lack dependencies (at least atk-bridge from at-spi).
As I'm working on software that has 3.4 as minimum gtk+3 requirement,
it's more important for me to update to 3.4 now than to 3.6 a bit later.


 - ML


