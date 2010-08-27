Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Op0Uc-0002jO-9B
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 17:05:23 +0200
Received: by wyg36 with SMTP id 36so3147424wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 08:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=WcM4fFMoTkiEMMlJ7D8HPATpikMhCNklklA/3bdVV0s=;
	b=ktY16uWhStSM7EVsHW8CQ1X4FDtqjbJhMhtaLrbWMCNSpKPcPvcmAYVzcHp46ycHg9
	0QGrPEz9AiV5owOS/QdaM5qzTNP+Ez9gh6Lu5ODobqm1mZ4VTAmquuY2RFEl+XastHD1
	BW6P6XD5vk1BpSQN4QdtLbMzN7kUvOTvyuPpI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=BH5OXVq32ZBlCr/by8V04Y8II/4a8N9JoaD4jdcW3GLfS/iEchxuBHp3yhAao4EjOp
	jylKBrsJP74RqI3EimzJU89HlUpY3WhyYynz57lBfTJtobegMmhP3u/UslZds9H90BvP
	9OBrZRHXC3M124VOFzI4PtRUO1yfMyNeMX/kI=
MIME-Version: 1.0
Received: by 10.227.146.213 with SMTP id i21mr835634wbv.99.1282921493647; Fri,
	27 Aug 2010 08:04:53 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Fri, 27 Aug 2010 08:04:53 -0700 (PDT)
In-Reply-To: <AANLkTikMx==1HnsZ12pGdWi4hdyzKmg4NJNO23EdACJS@mail.gmail.com>
References: <AANLkTim6-d4krhcMuAZojQVNdy3W-m_ON-mOvK5y3tqn@mail.gmail.com>
	<AANLkTikMx==1HnsZ12pGdWi4hdyzKmg4NJNO23EdACJS@mail.gmail.com>
Date: Fri, 27 Aug 2010 11:04:53 -0400
Message-ID: <AANLkTi=39EL+2Vq9=1LGhdB87dhsmmYOHtd7Gw8+nQXs@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-08-23
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
X-List-Received-Date: Fri, 27 Aug 2010 15:05:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2010 at 10:58 AM, Chris Larson <clarson@kergoth.com> wrote:

> I like the concept. =A0It seems not unlike the 'master' vs 'next' or linu=
x vs
> linux-test, or indeed, as you imply, unstable vs testing in debian. =A0I =
do
> want to point out that you could, if you chose to, include the tested
> baselines in the message attached to the tag (if annotated). =A0The only
> downside to that being you couldn't add to it after the fact the way you
> could with a wiki. =A0At a minimum, I'd link to the wiki page for that ta=
g
> from a tag message.

Thanks for the ideas -- I have updated the process some, and I think
we could apply the tag on the following Monday after the testing is
complete -- this would allow us to add the annotations.

I'm also thinking on the next cycle to use the name testing-next
(instead of testing-testing) for branch we create every week for
testing.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


