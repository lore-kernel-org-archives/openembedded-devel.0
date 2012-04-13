Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SIczP-0004Xp-0X
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Apr 2012 11:40:23 +0200
Received: by iaag37 with SMTP id g37so4102207iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2012 02:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=yUa6ZT057XGGfBlsAt67Ty5lbi9XwO+poISLPpqu0Co=;
	b=e/MTDqpoqutb2RZd7VxQrelIB6UxdmEbFO6M5X7SNrGBW2EpdtMbTmPJdGqrDmSbC4
	n222ikWsRZpPC5ypFGL5K9spPYkJx24XnByfBvPVW86t0UUkCSx8T1JlNEgxg9Poz9JH
	aiCH0OPhu/lpO3uYhtNh7TbNzorqvTx4z/8XVIkM3YEndgQKxSHP6jam/4SbhRB991AH
	qtef9b0tW9bYDFIglVtpWojaqtCwTeH/avZCXD6jzq64nVPzpFMel392bBTFsKjhRfLC
	L9GInjYITdOmg9OohLITx6j/9ToiS9C6QBQ1Y6PV4Jo6ox4jXuLNfnLTNqPSzBskGnCu
	IpZg==
MIME-Version: 1.0
Received: by 10.50.212.97 with SMTP id nj1mr808497igc.65.1334309461220; Fri,
	13 Apr 2012 02:31:01 -0700 (PDT)
Received: by 10.231.170.15 with HTTP; Fri, 13 Apr 2012 02:31:01 -0700 (PDT)
Date: Fri, 13 Apr 2012 11:31:01 +0200
Message-ID: <CAOHjBZudis3ALttGQZ12hxKPQbXKyffZVtoB1buz4AMaamXO=A@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [oe-core] how to add .bb file into project meta directory
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
X-List-Received-Date: Fri, 13 Apr 2012 09:40:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I need to add a new version for a given package and I'm wondering if (and
how) I can add the relative recipe in the meta-<my_project> directory as
well
as I do for .bbappend files.

Best Regards,
Giuseppe

