Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay@jay-tech.ru>) id 1PI5aD-0006NJ-5q
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 21:23:22 +0100
Received: by ewy24 with SMTP id 24so2855612ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Nov 2010 12:22:18 -0800 (PST)
Received: by 10.213.8.193 with SMTP id i1mr5177298ebi.23.1289852538695;
	Mon, 15 Nov 2010 12:22:18 -0800 (PST)
Received: from mozart.localnet (93-81-141-77.broadband.corbina.ru
	[93.81.141.77])
	by mx.google.com with ESMTPS id v51sm316554eeh.16.2010.11.15.12.22.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 15 Nov 2010 12:22:17 -0800 (PST)
Sender: Yury Bushmelev <jay@jay-tech.ru>
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Nov 2010 23:22:10 +0300
User-Agent: KMail/1.13.5 (Linux/2.6.35-ARCH; KDE/4.5.3; x86_64; ; )
References: <AANLkTin8E_sSKJcCW7_gtx85_Uo6SvwHFTdiUA8XZ2tv@mail.gmail.com>
	<AANLkTinh8PHmpMrPBQUUb26MAQmWzU==vKzSY9Y_StTx@mail.gmail.com>
	<AANLkTimg9YUNRoh+Qs8-jahK8mAJzpcEk9WiUOBFVNAz@mail.gmail.com>
In-Reply-To: <AANLkTimg9YUNRoh+Qs8-jahK8mAJzpcEk9WiUOBFVNAz@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201011152322.10481.jay4mail@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: jay@jay-tech.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
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
X-List-Received-Date: Mon, 15 Nov 2010 20:23:22 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hello!

> >> After my first week of doing some testing branch test builds I was
> >> thinking, would some form of either automated result submitting or
> >> form-based result submitting be a good idea?  We could try and use a
> >> google doc spreadsheet / form, for example.  Thoughts?
> > 
> > I'll prefer to use our oestats-server to auto-publish builds data.
> > Oestats have complete information about builds.
> 
> If someone has the time to update the oestats-server to provide
> summary data in a tabular form, that would be great.

I would to spend some time to look into oestats-server/client code, but it 
will happens after release anyway.

> Alternatively, using forms on a google spreadsheet is an interesting
> idea.  I had not thought of forms as a way that we could get anonymous
> build data with requiring a google account.  Then again, I'm not sure
> how we would keep the form from being spammed, other than perhaps
> hiding it.

My opinion is to leave things as is up to release (about 2-3 weeks).
IMHO, we should concentrate now on intensive build testing and testing on 
target machines.

-- 
Yury Bushmelev


