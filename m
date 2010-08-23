Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OnaN3-0001uQ-Rd
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 18:59:43 +0200
Received: by wwi14 with SMTP id 14so351784wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 09:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=xyV8Zcf5xbUBrJlFJilrdMTzkoipsVrCX7CWlJWQxZY=;
	b=q0dQta9Dhv3mqaBzjn9tSVgcfAsa6c6/umnG8Z9gV6ALFCg6w2oegUJf6qSsAWoqb4
	pEyLpAKN+i7UQw5b9Qw24yU6+0BvakQ0pUGFAj23WhqS3iEBzMWmGnCAxk/OHzBfhMQK
	KL9ZMbBgHk+o5GgnoL9iWTPGAj4Jda9rL6WIU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Inr75f+31vDxAZ5bBoZHj5wmP8ihxQ4fasU6Fo/3WwUjVwZiPUkEVIvgyEgDueXXUH
	GvjEamD86sL9AgoDJhvKKydymKJ2sKCBs2kJZURHi92nLK1IaCN5PO9KcfMELKn8QqeG
	0zirgRi+D4wIidXCYvYXdOY4QSqYv0QgoGgSU=
MIME-Version: 1.0
Received: by 10.216.1.18 with SMTP id 18mr1861245wec.24.1282582749205; Mon, 23
	Aug 2010 09:59:09 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Mon, 23 Aug 2010 09:59:08 -0700 (PDT)
Date: Mon, 23 Aug 2010 12:59:08 -0400
Message-ID: <AANLkTi=dy24JRuj7eCUJzfwm-tV2Zj=bq9w1V3C4g0oZ@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE stable, testing, dev
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
X-List-Received-Date: Mon, 23 Aug 2010 16:59:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 21, 2010 at 8:31 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>
> Perhaps share this load? =A0I'd volunteer to make some tests using
> my Fedora servers.

I have posted some initial thoughts to:

http://wiki.openembedded.org/index.php/Testing

Please sign up for combinations you want to test.  Perhaps we can
automate this effort more with tinderbox at some point.

I realize this is all very manual compared to "continuous
integration", etc, but I really think OE needs dedicated testing
manpower, and having a somewhat "manual" process will encourage
interaction and I think overall be good for the project.

I'm certainly open to other ideas.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


