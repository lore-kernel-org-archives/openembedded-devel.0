Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cdhmanning@gmail.com>) id 1PptnO-00085l-5n
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 03:40:42 +0100
Received: by fxm17 with SMTP id 17so2017079fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 18:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=vTH4YhjeRcH3iqZxJiVBGFwYP4A6Vu63aCvyZFH+T5U=;
	b=HA0D9qK9OnZvNsSkWZ29U9NzCVpPu11C2VfiYcwfYOI7i6kgbjT9ql6i+FhFj+Q8kI
	yeoW/hWwxNQ/1pUh7615p8F9Vbqa8Ba9TtgCRR8v3m6T8czN+TchSn3ahevfcv8HR/F2
	irnuzSJkLKmWojZU8akXjjuk+0BfkfoQGV6go=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=WkaDxsvBjkyzmSaQ8+WJ5Cak86yH/20zN6EywNiPWn2l+qDnzAhnsEkuAPEyeBfuJv
	lggd5ZW+OOK81b+oNtrQ5j4c6RA232s81z0oHnTyPmTP3OJToQ1OxK034eB9Ie6O6fcS
	Bf3/vGxGCu6iV0I33ZsCFKuCG59k5L2y97qhg=
MIME-Version: 1.0
Received: by 10.223.71.197 with SMTP id i5mr1668839faj.127.1297910370285; Wed,
	16 Feb 2011 18:39:30 -0800 (PST)
Received: by 10.223.93.205 with HTTP; Wed, 16 Feb 2011 18:39:30 -0800 (PST)
Date: Thu, 17 Feb 2011 15:39:30 +1300
Message-ID: <AANLkTimNyeGr3j55MSUs3gtuEXoCRwDGm7m2BhqSrH3t@mail.gmail.com>
From: Charles Manning <cdhmanning@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Where are the xxx-dev recipes for Enlightenment Foundation Libraries?
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
X-List-Received-Date: Thu, 17 Feb 2011 02:40:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello

There is a task-efl.bb which builds Enlightenment Foundation Library, but
there does not seem to be any xxx-dev recipes to get EFL into an SDK.

Does task-efl.bb actually do this? If so, how should it be used?

Thanks

Charles


