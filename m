Received: from [209.85.219.219] (helo=mail-ew0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sinestado@gmail.com>) id 1Mi69E-00079C-MI
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Aug 2009 14:38:15 +0200
Received: by ewy19 with SMTP id 19so4782062ewy.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2009 05:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=swxzGjwndna7vBrjGjL2JkNAUnSQtOyrR6vW+9YiCE8=;
	b=V9w/D5PAUVRyFzGdYkPX28WgWbUuNegoWHr4Qvm/b7eSiB5CwhujHcm6zPNXI2Yq4A
	ERFdnl2oHyUA2llXQkMvRDlOKGbAfuN6I3jqJ/IVL/0Vl4KXnr9N/KiZwF9l1/HBgkyi
	ku9JC1y/hGpzknnF7ljrfkRWfTaOYg5XIQ6sU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=xGCTPkGBFlnealqdUyNowpVxhsODXEubnnkckxuLfNby8Gp1pUaV9k/19SP2zQ0d1u
	iaRHpF0dvs9kARBWDQMNK9BuQakd10MoEtxuPTwAA7h3fL9Sgz4T/dFBgqGISGDZW8H6
	KdIES6yDXw9hgTzr+7Myvk29EkTzp5LxJEf28=
MIME-Version: 1.0
Received: by 10.216.89.135 with SMTP id c7mr1144589wef.62.1251721180825; Mon, 
	31 Aug 2009 05:19:40 -0700 (PDT)
Date: Mon, 31 Aug 2009 09:19:40 -0300
Message-ID: <a63ecaf0908310519p3bc80147q6ad2d89e4c587d@mail.gmail.com>
From: Sushi Sensei <sinestado@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Xorg int10 module missing?
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
X-List-Received-Date: Mon, 31 Aug 2009 12:38:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm trying to use cirrus driver but I can't load int10 and xaa
driver vesa also depends of xserver-xorg-module-libint10 but I can' find
this!!


-- 
------------------------------------------------------
--- Timeo Danaos et dona ferentes ---
------------------------------------------------------

