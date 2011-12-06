Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RXvxv-0000xK-1t
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 15:25:51 +0100
Received: by qadb17 with SMTP id b17so2680347qad.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 06:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=1wP8rmPqMTwSqxbO56HLhtp5Z3+GdQf8eYlMpMJVXso=;
	b=oqdvVLIteWtIBRFKTJgFTWA8K5NkBCWhD66dkQCSRO5X+a7NtxEPXJwYGvAWfNiIpY
	MEfQuKoqF4wbxD3AJR+b+4x/tZcDWHUuFAQMLVj8nPcMuQ7oz9sVHx0FM0+Un6cyqpUS
	ejwJeUKm8nEGAhCo8OZ0taH1db1hrf7dDsqVw=
MIME-Version: 1.0
Received: by 10.224.189.129 with SMTP id de1mr12354684qab.18.1323181138413;
	Tue, 06 Dec 2011 06:18:58 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Tue, 6 Dec 2011 06:18:58 -0800 (PST)
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C401A4A69@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C401A486D@post.tritech.se>
	<CA+M6bXnrw7p=5ACg99REKASR4L+0yzgunJ6xDWWSwcFeR82hww@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C401A4A69@post.tritech.se>
Date: Tue, 6 Dec 2011 07:18:58 -0700
Message-ID: <CA+M6bXknvvcPUdpgVLjUS_HrB34N2HJJSRBQMa0vYmTsn_RR3A@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] Pull request for libpam
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
X-List-Received-Date: Tue, 06 Dec 2011 14:25:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 6, 2011 at 12:55 AM, Mats K=E4rrman <Mats.Karrman@tritech.se> w=
rote:
>> From: openembedded-devel-bounces@lists.openembedded.org [openembedded-de=
vel-bounces@lists.openembedded.org] on behalf of Tom Rini [tom.rini@gmail.c=
om]
>> Sent: Monday, December 05, 2011 8:49 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [2011.03-maintenance] Pull request for libpam
>>
>> On Mon, Dec 5, 2011 at 9:42 AM, Mats K=E4rrman <Mats.Karrman@tritech.se>=
 wrote:
>> > Hello Tom,
>> >
>> > Please pull this commit from here:
>> >
>> > git://github.com/mkarrman/openembedded
>> > Branch: maintenance
>> >
>> > Mats K=E4rrman (1):
>> > =A0 =A0 =A0368c68a =A0libpam_1.1.1: remove directory preventing /var/r=
un from being volatile.
>>
>> Where is this a backport from? =A0Thanks!
>>
>> --
>> Tom
>
> My local project...
> Maybe I went ahead of myself but the solution is ~equivalent to the solut=
ion applied in libpam recipes of oe-core but 1.1.1 does not exist there and=
 the corresponding fix was a part of the original recipes for later version=
s.

OK, that's fine, so long as the general problem is fixed somewhere
else.  Please mention this in the future, thanks!  (and I'll take care
of the pull request once we've past 24 hours).

--=20
Tom


