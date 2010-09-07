Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OszBJ-0005kD-Fe
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 16:29:55 +0200
Received: by wwi14 with SMTP id 14so5406201wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 07:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=BOLlIrxziADESjiQJU8pwJS8McO+pHwum9280oHPD34=;
	b=eF6e5rnWISvKdDuF1qFGN7/i3woVoRI226l6nQ1yUQQaUBKvmPIpF9WmEFjSEAiteL
	1xN2MToCEq65oe9lnWVIweifoQlDiSJhATjQCERP3+z2lpqKhKgIb5N387kSVH7CxNX0
	3or3IawEB6hfUIorXFPUEPbUPu7/AePEbFNZ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=PXsC3K6MQz3eBHOYB9y/cmdQT/2/0jnbo20BwTm5AGCb3arMT8WItinjI7zxyRb57H
	On4HiHF94O2udwDbBrIYqDt9RciKRCGZKKkQh/XdqqYbFrq06COWuRo5nE4N7egCixG7
	cK770LRoEr/L6LT5pZ5SXKJXgSCMqg7xtwJdM=
MIME-Version: 1.0
Received: by 10.216.185.72 with SMTP id t50mr5074794wem.77.1283869741410; Tue,
	07 Sep 2010 07:29:01 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Tue, 7 Sep 2010 07:29:01 -0700 (PDT)
In-Reply-To: <AANLkTi=jLFN8N+R7wh27ZE1hqoktiibGhO1-LuS-KOZy@mail.gmail.com>
References: <AANLkTikDDfWBM=VfC_XBzkp+-ZMycJ6kqkS56=_O6xW4@mail.gmail.com>
	<AANLkTi=jLFN8N+R7wh27ZE1hqoktiibGhO1-LuS-KOZy@mail.gmail.com>
Date: Tue, 7 Sep 2010 10:29:01 -0400
Message-ID: <AANLkTimo0OrOhiMDdPzb3tMKObru0H+iy_aS2EL_HG-C@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE donations
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
X-List-Received-Date: Tue, 07 Sep 2010 14:29:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Sep 4, 2010 at 3:43 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/9/3 Cliff Brake <cliff.brake@gmail.com>:
>
>>
>> Our immediate financial need is to upgrade storage on our server hardware:
>>
>> 4 new 1.5TB drives. Approx $1k
>
> Maybe before we spent 1k on disks:
>
> How much diskspace do we have now?
> How much of it is used?
> And what stored is on it?
> And why is this massive amount of storage (4.5 TB assuming they are in
> RAID5) needed?
>
> I feel 1k is a big amount for a small e.V. like ours, and before
> deciding on the spending of it we should probably first discuss the
> issue and evaluate other options.
> E.g. maybe we can find a sponsor to donate some space and bandwidth on
> their server.

We share hardware and hosting costs with a number of other projects like:

foonas.org
nslu2-linux.org
openwiz.org
preware.org
webos-internals.org

Historically, we have funded very little of the server costs at the
OSUOSL site.  I personally purchased a CPU for them at one point, and
I'm not sure much else has come from the OE project.  So from a
project standpoint, we are likely behind when it comes to paying for
our share of the hardware costs.

The 4.5TB will likely be shared with all the above projects.  The
http://wiki.openembedded.net/index.php/Infrastructure page lists some
of the resources allocated specifically to the OE project.  Other
resources (such as a dedicated database server, and backups) are not
so apparent.

So in summary, we should fund at least a portion of the above storage
costs.  Personally, I'm satisfied with how things are OSUOSL are run
-- Tom King and others spend a lot of volunteer time keeping things
running.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


