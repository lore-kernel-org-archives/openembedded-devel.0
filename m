Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PK4lA-0002jS-Gs
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 08:54:53 +0100
Received: by gwaa11 with SMTP id a11so3708511gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Nov 2010 23:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=1Xmlf0HJhFpoAhUZ0hP4CwLniTmb7Bp2M5S63NZ4iBE=;
	b=MXu6/J8oM252yo3sJ1jO6mKBdm1KxjWQtU1aBcigmppn3Q0LmygpJOhYuVcspVb0cz
	rNufhQtIauOH+og0uPzSs0H6EfLxH5+rhVOhvSQRkIipQU2aXMP8iJdQgpKCAa0E4aVl
	zSTej79MreihtCExLoMuwCv+RGYGRhu1tO+z0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=Kuo8c/TQx+O7zlMgGBoxXnNkBHk2DmdUPm40xW7BY2gE2MVJN7Q9lKQXuNeW79/Hzw
	W2Z4R4JDdXc3dJXWEdwBjFjG0pZqtCwL4uJKsIFdDDNaloF+qHdmX2U4C2c9avHjtnWL
	qMtFPgP17MpiPInleLjuwqdvxNo5Z9H1bPl74=
Received: by 10.91.121.3 with SMTP id y3mr5313209agm.156.1290326019930; Sat,
	20 Nov 2010 23:53:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Sat, 20 Nov 2010 23:53:19 -0800 (PST)
In-Reply-To: <4CE739F6.5020303@balister.org>
References: <4CE739F6.5020303@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Nov 2010 23:53:19 -0800
Message-ID: <AANLkTinq6+aKi37C5RvuaK6Ae7BT_vUZx6J39NHKz8t2@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Commit for the release
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
X-List-Received-Date: Sun, 21 Nov 2010 07:54:53 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 19, 2010 at 7:01 PM, Philip Balister <philip@balister.org> wrote:
> Khem, I'd like this commit to go into the release branch. Any objections?
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=c59afd9fd456766c473c4fb7f7cc4db3e8623c39
>

Looks good to me. Do you want me to cherry pick it ?

> Philip
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


