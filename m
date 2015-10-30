Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id CE47E607A5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 13:26:51 +0000 (UTC)
Received: by wmll128 with SMTP id l128so12262250wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 06:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=ZDHww9jCNQdWzxQoSwk5OLe8uLYfDBljJPHjO6mQpMU=;
	b=Oq/kscvMIYNX080EC3Js+0tFHQfj6sDQc+LxAwHxnGHCt2WN2Otbuj/jOG56RqETHN
	ay+VW0FUJeo+Dhl8ngDx9Yk+3qZEOHhBOhdHw5tZFxXhHpNZY5fRSeK0vUPO9TIBYbsv
	K4EXqeVodo072kObQfrDuR74Wkn9zPL6Xdn52qf5FwvoCoXmo718CHxLAVkzpw5tlCu4
	rY4EnzqrKkRt1s0khgZMU79T7Cqhy5DMEvh7yZihjG+sUFU6/qvVYf9pAvH06VyWhqqg
	caiIXv9iXDQ8j3bzp2P4+SP+uGKTCymGSQjz0KL5kETrkDqQ1J8NYEvBpovhflnprMDX
	k5ag==
X-Received: by 10.28.91.72 with SMTP id p69mr3567859wmb.49.1446211611671;
	Fri, 30 Oct 2015 06:26:51 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12])
	by smtp.gmail.com with ESMTPSA id l1sm2874738wmb.1.2015.10.30.06.26.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 30 Oct 2015 06:26:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAP9ODKojDcEswMdNpVct53UEg7r9WcOCFZyUtx2xb74ruY8aPA@mail.gmail.com>
Date: Fri, 30 Oct 2015 14:26:49 +0100
Message-Id: <EDA77C66-BD25-414C-8EA8-6D7FFD9C8D82@gmail.com>
References: <4BA9AF94-31D9-4B1D-99DD-5D1DE20533EA@gmail.com>
	<17C19527BD855F428F22685986FD58BEA16318@IRSMSX103.ger.corp.intel.com>
	<25A9A07D-261D-4E51-98CB-EB3307D7D9A2@gmail.com>
	<17C19527BD855F428F22685986FD58BEA16409@IRSMSX103.ger.corp.intel.com>
	<CAP9ODKojDcEswMdNpVct53UEg7r9WcOCFZyUtx2xb74ruY8aPA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-java][PATCH 4/4] openjdk-8: add recipes for openjdk-8 and openjre-8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Oct 2015 13:26:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 30.10.2015 um 13:59 schrieb Otavio Salvador =
<otavio.salvador@ossystems.com.br>:
>=20
> On Fri, Oct 30, 2015 at 10:41 AM, Kaaria, Erkka =
<erkka.kaaria@intel.com> wrote:
>> I don't know if there are actually any issues when bootstrapping with =
openjdk-8-native. I just wanted to raise the issue as the openjdk build =
readme warns against this.
>=20
> Use a "-c cleanall" for openjdk-8 and confirm the binary files are
> updated. Jens, please do the same.
>=20
> So we guarantee the md5 are real.

I don't get what I shall do now beside a rebuild and an "ls -l".
Can someone explain me more detailed what is expected?

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


