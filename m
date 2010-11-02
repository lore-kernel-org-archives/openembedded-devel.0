Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anders.darander@gmail.com>) id 1PDD7x-0001Sl-Jj
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 10:26:02 +0100
Received: by gwaa11 with SMTP id a11so4027674gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 02:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=KK58jmcOXwwgbRHNPaFBwMIlKzQxo7LUiLYzxySlkms=;
	b=v5NhEHxaxIFQ/8nMl+ABa6DdpBprSSlvapE9+92ZVdtwY0WmVs6r0NU0GCxgIPz7tz
	kggtORkcQuTJxShFz0H2oZvRuYS9arywJNDlVKYS7wmnGqKF4A7/FrItbwnkVuwho0vR
	0boMBSDH95TCSa7/mJ2puVi6I+po9wVJrdP68=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=vfCNHOH/g6UaYj52vim4l9uaTxOcUqV0b0sqv1YTiJLWELeSN4ejjE0reDP/JJWDQl
	V0Jp3F7hWdod34zgNxshOLC35lPRB6A7yMgRsPmSEWGjs3adcBRHrcGAeAPgg27R7HXP
	2eMgxH3b0/R3UVi1PTkfElO36IiIjmflImjzQ=
MIME-Version: 1.0
Received: by 10.150.158.16 with SMTP id g16mr4743884ybe.242.1288689910994;
	Tue, 02 Nov 2010 02:25:10 -0700 (PDT)
Received: by 10.150.177.7 with HTTP; Tue, 2 Nov 2010 02:25:10 -0700 (PDT)
In-Reply-To: <20101102091907.GC3440@jama>
References: <1288689207-4850-1-git-send-email-anders@chargestorm.se>
	<20101102091907.GC3440@jama>
Date: Tue, 2 Nov 2010 10:25:10 +0100
Message-ID: <AANLkTimAvAoCLyp=rz-uJk1UPqm=ws4o=K7CUpiUf=Gv@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: anders.darander@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] Resolvconf: update to 1.46
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
X-List-Received-Date: Tue, 02 Nov 2010 09:26:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 2, 2010 at 10:19, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Nov 02, 2010 at 10:13:27AM +0100, Anders Darander wrote:
>> +PR = "r1"
>
> It should start with r0 or no PR (as r0 is default).

Thanks for spotting this.
I'll send an updated patch during the day. (Waiting some more time,
allowing for more comments).

Regards,
Anders Darander


