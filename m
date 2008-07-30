Received: from [64.233.166.177] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1KO9u0-0003r1-5g
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jul 2008 13:31:32 +0200
Received: by py-out-1112.google.com with SMTP id y77so127379pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2008 04:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=30qUZ86TYmPs+9/V7G9WIjHyRzMPTu+N/vOMmyJodew=;
	b=XnZ9qtMfUvy0deW665b/KjmevhZoLdFMapvJbIGvIH/mxuTtKXYWha6XOdbixdbbTR
	dmP1u5ZfwRQgZfdzHA9aDErQPgsWkScr8sBVkpbsr6rmXCAFmaVZzeKdAnseqil/GQrY
	37pWApM/U2s4Sf+gu3XBl0Lnv4RzAc13YSGrg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=NAXTUrPqXGAQCs24K2xApFDgN0KaHIh2WJvlfeh8IHDypmcHoyrdvgiIkXergagAzj
	HrjadElqV0BpeYIsLVB4vNd0fvghSGt+AtLCygxBvWnx64IlvCS+74Tl4HIkvYzjZ4Ig
	+Y6vy8lHNgmTNACxu+6SiBTW+lrAUpJ6xXXeU=
Received: by 10.114.155.1 with SMTP id c1mr8271752wae.24.1217417389863;
	Wed, 30 Jul 2008 04:29:49 -0700 (PDT)
Received: by 10.114.184.13 with HTTP; Wed, 30 Jul 2008 04:29:49 -0700 (PDT)
Message-ID: <f96d234e0807300429j2fff8df0oc494e4a5beb9f8ff@mail.gmail.com>
Date: Wed, 30 Jul 2008 07:29:49 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200807300920.37221.openembedded@haerwu.biz>
MIME-Version: 1.0
References: <1217340989.5482.10.camel@dax.rpnet.com>
	<488FAE77.7050107@whitby.id.au>
	<200807300920.37221.openembedded@haerwu.biz>
Subject: Re: Git Migration Status
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 30 Jul 2008 11:31:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jul 30, 2008 at 3:20 AM, Marcin Juszkiewicz
<openembedded@haerwu.biz> wrote:
> On Wednesday 30 of July 2008 01:57:43 Rod Whitby wrote:
>> Richard Purdie wrote:
>> > There is also the issue of commit ID naming. I'm tempted to propose
>> > we use commit IDs with a domain such as
>> > userid@developers.openembedded.org. This would allow email
>> > redirection should we ever want it without interfering with the
>> > main domain. The alternative is to let people use their own domains
>> > but this means the IDs change when people change email address and
>> > isn't really consistent for the metadata and maintaining a single
>> > identity. I'm really open to opinions on this though.
>>
>> Just use real email addresses.  If someone doesn't want to use their
>> current home or work email address, or has an address that they don't
>> own (and therefore will change in the future), they can easily get a
>> google mail or yahoo mail account purely for a commit email address.
>>
>> The Linux kernel uses real email addresses.  Why would OE do
>> something different?
>
> I am also for real email addresses. If someone wants to use
> userid@dev.openembedded.org as commit one I am fine as long as this
> alias works as email. Now I do most of OE related job during my OH hours
> so I would prefer to commit as hrw@o-hand.com and as
> openembedded@haerwu.biz for my own stuff. In both situations there will
> be real name attached to email so it should not be a problem to contact
> me.

Using real email addresses would also simplify server admin and be one
less load on the server.  When the spam starts flowing, this can
require a significant amount of network bandwidth.  Where I host my
main web site and domain, the owner claims spam to email accounts is
by far the greatest use of bandwidth, and he spends a lot of time
implementing anti-spam measures.  With limited resources, simple is
good!

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


