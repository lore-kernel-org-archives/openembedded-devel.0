Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1ObIA6-00024E-M6
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 21:07:37 +0200
Received: by fxm12 with SMTP id 12so3124752fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 12:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=LT7ST7WMBCV8uIh69c72Qd+sDCkeY2NmQBRK0T81Vlk=;
	b=hmhBnlcgdvZAjOORa/gTBdDPjpcwDedQGBhkj9et+OGvAu/cZRb5tgTIjEqHV5FDle
	IqrsRBToPu2Sriujt8G4IgeaaAKqVTE6Yi3VvDcQ3cuX4s4quoMI19F9jTT+wkQK6flW
	R1pew1lOBtN4p4xdpTR8L7hnFGLsPo1hS133c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=kjIxBBXkxMqWzliHHwvrtwScGP5N6W49GxmaZ1AslatO9JzU0HloG74U1IiFMiRn2u
	s1uyU9t52Qt2l48zhNsG2+B729yvgtGSAi7+fb0YoD7carBCzfhQXrmW2LTKTmNBWZxd
	gy5m0umnHOKJWQVqgWfbJUNkr6lWYGC0T6Imo=
MIME-Version: 1.0
Received: by 10.239.135.78 with SMTP id c14mr474032hbc.64.1279652840677; Tue, 
	20 Jul 2010 12:07:20 -0700 (PDT)
Received: by 10.239.181.207 with HTTP; Tue, 20 Jul 2010 12:07:20 -0700 (PDT)
In-Reply-To: <20100720173425.GL1512@excalibur.local>
References: <20100709204055.GA12163@excalibur.local>
	<20100720070108.GE1512@excalibur.local>
	<i23lkm$ftn$1@dough.gmane.org>
	<20100720084026.GI1512@excalibur.local>
	<i24kf7$3d3$1@dough.gmane.org>
	<20100720173425.GL1512@excalibur.local>
Date: Tue, 20 Jul 2010 21:07:20 +0200
Message-ID: <AANLkTikYdD7jzsJBNEK0MedOmM_jHIEcdCfE0APMSOqt@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] New stable branch (and maybe a new process?)
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
X-List-Received-Date: Tue, 20 Jul 2010 19:07:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 20, 2010 at 7:34 PM, Stefan Schmidt
<stefan@datenfreihafen.org> wrote:
> On Tue, 2010-07-20 at 18:56, Koen Kooi wrote:
>> And of course the number of people screaming for a stable branch is an
>> order of magnitude larger than the number of people that end up actually
>> supporting it.
>
> Sure, that is no surprise. :)

It might be surprising to some, but some of those not actively
supporting the "stable" branch might choose not to do so because the
chosen stable process does not fit their needs.
Most likely, all people contributing to stable is mostly happy with
how it is handled.

/Esben


