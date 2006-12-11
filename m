Received: from [64.233.182.187] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1Gtsh2-0002j8-3I
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Dec 2006 22:28:12 +0100
Received: by nf-out-0910.google.com with SMTP id l24so30384nfc
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Dec 2006 13:26:41 -0800 (PST)
Received: by 10.49.41.12 with SMTP id t12mr132692nfj.1165872401427;
	Mon, 11 Dec 2006 13:26:41 -0800 (PST)
Received: from CUBE ( [82.193.96.237])
	by mx.google.com with ESMTP id g1sm408810nfe.2006.12.11.13.26.40;
	Mon, 11 Dec 2006 13:26:41 -0800 (PST)
Date: Mon, 11 Dec 2006 23:26:42 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <7310051684.20061211232642@gmail.com>
To: Marcin Juszkiewicz <openembedded@hrw.one.pl>
In-Reply-To: <200612112150.15571.openembedded@hrw.one.pl>
References: <456B0DC2.90300@dominion.kabel.utwente.nl>
	<444521399.20061208175939@vanille-media.de>
	<1165789899.5604.43.camel@localhost.localdomain>
	<200612112150.15571.openembedded@hrw.one.pl>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: To be removed recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Dec 2006 21:28:12 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: quoted-printable

Hello Marcin,

Monday, December 11, 2006, 10:50:15 PM, you wrote:

> Dnia niedziela, 10 grudnia 2006 23:31, Richard Purdie napisa=B3:
>> On Fri, 2006-12-08 at 17:59 +0100, Michael 'Mickey' Lauer wrote:
>> > Richard Purdie wrote:

>> > >> Package Name:   bluez*2.*
>> > >> Reason:         Obsolete by, and conflicts with bluez 3.7
>> > >
>> > > Fine with me.
>> >
>> > This can be a problem for Opie, since we used the no-dbus version for
>> > quite some time to save space.
>>
>> In that case we can't remove the no-dbus version needed by opie.

> Does someone tested OPIE with dbus version at all? How much does extra
> packages take etc? Without such testing sentence 'do not remove=20
> bluez*nodbus because OPIE needs it' does not have sense.

> I also would like to get rid of bluez 2.x because it will be unmaintained
> software soon due to fact that everyone switched to 3.x versions.

  I agree here, but removing it in such manner hardly helpful either.
Is anything magic in those 2 weeks which are given stuff in
removal.txt? We can have 1 month, 2 month, 3 months, 6 months, 1 year
removal periods. That "6 months" fits bluez2 pretty well, IMHO.




--=20
Best regards,
 Paul                            mailto:pmiscml@gmail.com



