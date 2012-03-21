Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1SALE1-0003Hi-Sz
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 14:05:14 +0100
Received: by vbbfr13 with SMTP id fr13so509008vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 05:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=EmboT0Axug7s/Nv69XmSY27ql+ETFHgTmu/J5BK1AFQ=;
	b=Ww92GzJ8/TXQ5C5e9vFz83swJecrOkvtGKMZZafmWDNS5SxrtDaVJsAdjPwkzQDzYH
	mKMwu8UFbLghG/YV7+FK3LLDKYbHUWZLjOkgopSvTBYQjPNlV43Fv1LxnsjXEmTJxi7I
	dL6GrZo8FPqGX5vDNj/cyB5TDflnvijxHKc9h8mAbWGyj3GH0HFgiDBslR6JgjXJ0+zg
	p0zYHCTJjYspQqYAwCOzkQnBaPiI5VQirs/8EmwwYZV9FSi/ja7jJE+TjDOoUqQPPHn6
	AFAwfAm7UowygXLDGGt/MCpWbrXxbYv1933+z1BdDlMoXMJ/mA1CHLkVi/ES5rxB2GB1
	svYg==
MIME-Version: 1.0
Received: by 10.220.116.10 with SMTP id k10mr1835288vcq.25.1332334579955; Wed,
	21 Mar 2012 05:56:19 -0700 (PDT)
Received: by 10.52.69.37 with HTTP; Wed, 21 Mar 2012 05:56:19 -0700 (PDT)
In-Reply-To: <jkcgem$agm$1@dough.gmane.org>
References: <1332263919-19283-1-git-send-email-koen@dominion.thruhere.net>
	<1332263919-19283-4-git-send-email-koen@dominion.thruhere.net>
	<CALbNGRRwoJ7MqVFdoCWQC5bmf+HgZD_QV1jUj2Q1nR-jXZWXfg@mail.gmail.com>
	<jkcgem$agm$1@dough.gmane.org>
Date: Wed, 21 Mar 2012 13:56:19 +0100
Message-ID: <CACW_hTZ_EvDtsMosYJef9NDWgi2E-9Pf_vYONvXn3JcEz+Xv_w@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe 4/4] udev: remove 175
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
X-List-Received-Date: Wed, 21 Mar 2012 13:05:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2012/3/21 Koen Kooi <koen@dominion.thruhere.net>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 21-03-12 08:49, Andreas M=FCller schreef:
>> On Tue, Mar 20, 2012 at 6:18 PM, Koen Kooi <koen@dominion.thruhere.net>
>> wrote:
>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>
>> Could we wait with this until libertas works with udev >=3D 177 [1]?
>
> I'd rather live with the breakage so people are motivated to fix the
> libertas driver. Unless someone commits to maintain the 175 recipe, of co=
urse.
>
> regards,
>
> Koen

Interesting point of view.
I still recall the flak someone gave when some breakage occurred
because some old recipes were removed....
Seems the world is improving after all ;-)

Have fun!
Frans

PS: not volunteering to maintain 175; My products are still perfectly
happy with static device tables.


