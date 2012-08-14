Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1T1Gje-0003z2-0K
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Aug 2012 15:00:38 +0200
Received: by ghbz2 with SMTP id z2so401348ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2012 05:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=yDPRLQWvyLeh/197OHCp6occnHEuSUn+L+6tOrD3sac=;
	b=euv/8VxgiCUJtmspf1Kh48hXCiBH8eQJsmb1ZHLvKPl0pxA2Z8QQ0PIm6uBkyLIrCg
	35t7qefqw2m2clIMf9jPHzC49yuqe199pax83W8mR0mRhbGzy2AGFglQo1cyUNbLo9gv
	4W1VLGVcjvAQXx8ka1Zovn7frKVHaU4o/Ck8DmH1PazsxRbhGOjYGj0Wbgv5XQVUKQUC
	dMlPbp9nc05no7BAcvQtQfQFvc+0pikJUybw8oK4pDcHUais2RbVZahkK7UnPBJ9ZiGe
	IRieRyY8Dv5Bld5StyN+kM6c6LV+eOS/zwz/uDH2ZcitEWatfaqhvUdowuJjjoipmgxe
	kA6w==
Received: by 10.68.136.138 with SMTP id qa10mr30728122pbb.103.1344948522703;
	Tue, 14 Aug 2012 05:48:42 -0700 (PDT)
Received: from [192.168.1.101] ([94.205.108.162])
	by mx.google.com with ESMTPS id sj5sm755857pbc.30.2012.08.14.05.48.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Aug 2012 05:48:42 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <k0deme$loo$1@dough.gmane.org>
Date: Tue, 14 Aug 2012 16:48:36 +0400
Message-Id: <3E30F641-ACE9-41DA-BD4D-5467D0C6E081@gmail.com>
References: <B39AAE57-63B2-4EFA-A037-4F225E1CB21B@gmail.com>
	<k0d7ai$odu$1@dough.gmane.org>
	<11ACFBF2-567C-4A7C-85B8-620806B8DF07@gmail.com>
	<k0deme$loo$1@dough.gmane.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1278)
Subject: Re: [meta-openembedded/toolchain-layer] Adding retired toolchain support for gcc-4.5.1 and eglibc-2.13
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
X-List-Received-Date: Tue, 14 Aug 2012 13:00:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

On Aug 14, 2012, at 4:01 PM, Koen Kooi wrote:

>> The gcc-4.5 recipe was adapted from the gcc-4.5.1 recipe from the =
denzil
>> branch.
>=20
> The meta-toolchain denzil branch had 4.5.4

Yes, you're right. I intentionally dropped it to 4.5.1, but I'll update =
the existing
recipes 4.5.4.

Elvis Dowson=


