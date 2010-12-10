Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>)
	id 1PR5CR-0001Cr-PB; Fri, 10 Dec 2010 16:48:00 +0100
Received: by wyb40 with SMTP id 40so3716729wyb.6
	for <multiple recipients>; Fri, 10 Dec 2010 07:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=7F7+oKoNOcHcwVDJNXQIUBLv7gd/C67oiqSCMp1TRTQ=;
	b=n/nbFrycNlHUxlGSSj7zdUt1If5iqDi8lwg5jrcND04KWC9Vf0GBzM56tIKk4zYnu1
	aIdgs16wxNeEkN2w1Okt84OIr526FJCPD5//4eMpp9pf50655ww724W8M7QWUbwRKoMG
	OetK3tMLzSUhKJOdiB+CqjBOWtmkzb3YtlfmQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=Lg54J4140G7RUXvPZjENdgkYU1dxKFdrgklgmdsC/tS/bv7PLVfO+XeRUfEsr2odU8
	kQGj7lAosiJqwjJtL0rXIOxNeEKJ/wLFk8gOcLhZknPRVMQzdNOWa4tji+iuduenjUYV
	OZbu9r5YieexlbdMzKoen0gBlXuE5ez4Am+iw=
Received: by 10.216.181.74 with SMTP id k52mr1164193wem.42.1291995987868; Fri,
	10 Dec 2010 07:46:27 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Fri, 10 Dec 2010 07:46:07 -0800 (PST)
In-Reply-To: <4D024894.6000906@balister.org>
References: <4D024894.6000906@balister.org>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 10 Dec 2010 08:46:07 -0700
X-Google-Sender-Auth: 46aZwUp33YqdREhQaExjpMx7wx0
Message-ID: <AANLkTimU_dbcA3F2tF=mJYrPoVjgqddiq9DjuNc14XSZ@mail.gmail.com>
To: openembedded-members@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Write up of Embedded Summit by Cliff
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
X-List-Received-Date: Fri, 10 Dec 2010 15:48:01 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 10, 2010 at 8:34 AM, Philip Balister <philip@balister.org> wrote:
> I nice write up of the Embedded Summit held last week. Cliff Brake was one
> of the OE people that attended. Here is his write up the meetings:
>
> http://bec-systems.com/site/755/yocto-and-openembedded

One minor addendum to this: the Yocto project is open to getting some
of OE's developers in as maintainers in Yocto/Poky's workflow, and the
Yocto project would like OE to nominate someone to sit on the Steering
Committee with the folks from the member companies.  I note this to
ensure that no one thinks that we're just going to lose control over
the core of the OE metadata.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


