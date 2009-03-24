Received: from [74.125.44.156] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lon.lentz@gmail.com>) id 1LmDIN-00016w-22
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 21:32:23 +0100
Received: by yx-out-1718.google.com with SMTP id 3so1897610yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 13:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=/QBNS0prSepCU+fvZHXm92vD4ZspJgPAfom38lnKH6g=;
	b=wV2Hf2UqLHl/ODGgAxT+vipo2e106Nm+Yk9Lohb1A3E3UT9lKi9upRnNyvFbI6G8cB
	yH23gw5RrmFLi7sPri7ipWEUeNwmJmwxc12Af3fPzWFUesZ0KZzvRJ4EGFQieBjGdiSQ
	2kE6zS9UJnVbDdhNtGE7BPO7qVdXa0ISZP1H0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=SxnoUsvhnHY0Z4fT1Pmx0zRyEhEqyY7JjlAe1mtBphpLaDR5aL2QGAAO8F68ajWDcH
	KUGIhxsR2MMhdbB+mkza8O4+v4SXk4Q/8+AWlarK03/qFDMSGh0832HXwwknQ5mcO2w4
	s2WcNFWSPwZuaSzY56b4gdjNayScxSrPCIkx0=
MIME-Version: 1.0
Received: by 10.231.16.74 with SMTP id n10mr2271574iba.23.1237926652485; Tue, 
	24 Mar 2009 13:30:52 -0700 (PDT)
In-Reply-To: <b6ebd0a50903241301r5b8972b4s59df7be41052ab7a@mail.gmail.com>
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
	<1237885606.5348.8.camel@dax.rpnet.com>
	<b6ebd0a50903240808p4e07c61g6a088df634e161b2@mail.gmail.com>
	<ac9c93b10903241136q779fe115sa595c31200b707c6@mail.gmail.com>
	<49C92CC7.2080801@gmail.com>
	<b6ebd0a50903241205h6813f898i87351aaad17b6775@mail.gmail.com>
	<49C93237.7010205@gmail.com> <49C9347C.7010309@balister.org>
	<FA1C2D98-DEF3-4694-A757-7C137F667CE3@ngndg.com>
	<b6ebd0a50903241301r5b8972b4s59df7be41052ab7a@mail.gmail.com>
Date: Tue, 24 Mar 2009 16:30:52 -0400
Message-ID: <dc6682e90903241330m1191395j478ee4180a969cfb@mail.gmail.com>
From: Lon Lentz <lon.lentz@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Package Maintenance
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
X-List-Received-Date: Tue, 24 Mar 2009 20:32:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

  Please excuse my ignorance here, but what happens when a package literally
has no maintainer?

  Is OE attempting to manage a consumer facing product or provide a
centralized clearinghouse and methodology as a service to developers?


On Tue, Mar 24, 2009 at 4:01 PM, Chris Larson <clarson@kergoth.com> wrote:

> I don't think the current method is difficult, persay, but rather I'd
> like to see:
> - More individual responsibility in the project in general,
> particularly in class and recipe maintenance.
> - Clearer delineation between what gets the most attention and what does
> not.
>
>

