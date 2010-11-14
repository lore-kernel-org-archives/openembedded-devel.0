Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PHh45-00012B-OZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Nov 2010 19:12:34 +0100
Received: by iwn42 with SMTP id 42so5894179iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Nov 2010 10:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=B9uxjEVrJmlUClDU9jagDmYsFzGVtVOtQJBw+qjAkcc=;
	b=cS4lFwcqLeSMVFQmHt1bZjZ18MK2FDXNeEbMuf3OoBIMRegLxvowjMiqz6TX8uZOTi
	vJyxfSVTnxXf79O5hDWUpFXRyEgh6/g5IF0oykfH6DxMoFoA2HqsOjKAOXlIqezSqFBT
	XgFOcGe0j588I/ZlRH+0pH5poUF/fTnfmegJg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Mf5oLfvSHEmZRPacYzSGpJh2F7P42fqR6HLQvzTlWztQ/AXgsQomHjGYz/CcmiJicd
	/4Tu1hNqz7WWNDZUqK+am7dVddFIDeC5MTmSnP9BnIwA9JGliRptIwhFR3oX8B5eD9dI
	3ml9WUgLOLHpD9CVnN8WfLdJ+zAqXC6QRbvmM=
MIME-Version: 1.0
Received: by 10.231.17.203 with SMTP id t11mr3692865iba.1.1289758291697; Sun,
	14 Nov 2010 10:11:31 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Sun, 14 Nov 2010 10:11:31 -0800 (PST)
In-Reply-To: <AANLkTin8E_sSKJcCW7_gtx85_Uo6SvwHFTdiUA8XZ2tv@mail.gmail.com>
References: <AANLkTin8E_sSKJcCW7_gtx85_Uo6SvwHFTdiUA8XZ2tv@mail.gmail.com>
Date: Sun, 14 Nov 2010 19:11:31 +0100
Message-ID: <AANLkTinuoktvgvT9V7OX1=FkMfeAgztmDaOCFMdH5x7d@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-11-12
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
X-List-Received-Date: Sun, 14 Nov 2010 18:12:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/12 Cliff Brake <cliff.brake@gmail.com>:
> testing-next is ready for clean builds. =A0Not many builds succeeded
> last week--I suspect people have been busy:

Actually my builds also succeeded (apart from the neek one which seem
to require some more love). The autobuilder did it's job quite nicely,
but I was just not around to verify the results and update the page.
The neek requires at least the os2 patch.

Testing 2010-11-12 gives the same results. updated the testing page.

Frans


