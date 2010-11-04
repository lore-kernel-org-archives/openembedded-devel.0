Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PE8bO-0000em-L1
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 23:48:15 +0100
Received: by wya21 with SMTP id 21so2470326wya.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 15:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=7ikUwEAzrVz7U7ym/bvz2G559gGm9K5/rUMDhvan6ho=;
	b=WWTL9rIsDVZoteAio016KGmXgk+aCSzSU/4IIzzDE3Psz+ipWOonaQuYrEbL7IUBcM
	q0aUq7kS/dqxVtdNTdc/nzqVLfF888kyTHM4bOsjoZwv6+RtyGjitrg5fB1OvLrkTY/X
	Ciod46nGqFlQlMM3gPho2iJCIJ8LcmK2ozV48=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ir9CaY3t/P4Yd6xh9wEM2CsbkTvVDKmtdHAJpfQXCK+AOvKHL2WxMq4OKc7ItQF5Ew
	tlDlxQl8qRSM2Qi/9hy3AS/66fyiI2NfDibo0LWKpOuovwWmIllgR3H19tjG4XpYswlA
	xX8G9m2dlQ7Kn8eARWZrMfwSlBPhMAfW4py1g=
MIME-Version: 1.0
Received: by 10.227.132.206 with SMTP id c14mr614189wbt.78.1288910841383; Thu,
	04 Nov 2010 15:47:21 -0700 (PDT)
Received: by 10.227.37.205 with HTTP; Thu, 4 Nov 2010 15:47:21 -0700 (PDT)
In-Reply-To: <4CD3349D.6060904@eukrea.com>
References: <AANLkTikEvXr_vz+_uy871SM1B5SS=e6kb62sPyt-4GaD@mail.gmail.com>
	<20101104220649.GE28852@denix.org> <4CD3349D.6060904@eukrea.com>
Date: Fri, 5 Nov 2010 09:17:21 +1030
Message-ID: <AANLkTikzUf8yRz-W8aKmgQ5PpqadZDhAFxEuMwUKTiW_@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OpenEmbedded Release 2010.12 --- needs your help!
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
X-List-Received-Date: Thu, 04 Nov 2010 22:48:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 5 November 2010 09:03, Eric B=E9nard <eric@eukrea.com> wrote:
> Hi,
>
> Le 04/11/2010 23:06, Denys Dmytriyenko a =E9crit :
>>
>> - OpenEmbedded releases are planned to be time based and happen every 3
>> month
>> (quarterly), starting with the first one on December 1st.
>>
> - what about a "no major change" freeze period for 2-3 weeks before each
> release to have a enough time to stabilize a little bit the beast ?

This seems like a very sane thing. Can I further suggest a "no new
recipes" freeze (perhaps only in the last week).

-Graham


