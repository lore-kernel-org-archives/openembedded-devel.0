Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OtE1F-0002I4-3W
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 08:20:30 +0200
Received: by gya6 with SMTP id 6so2465819gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 23:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wC6EWmAulzOZZHbATqu+8Gihmg9z3AaodLdC0z6BNGs=;
	b=ikOc2iBYC8YYKDQoXyHih6CWfs7kKBHkMNvUJurwLj5txDHzvVB0dC0dvsrNwApcBp
	ukUKV64ftYwCvAvxZ1Nr3OdVbCRqMVVjcMUevjRfg+c+Eu4pmKBH/+d5ND0TK43aErl6
	h3BoswQg3DuJ4wIs5xqUKGF1WIMExPlX46H5E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=YoG5JOMyjJuF69o1g0SAHqDVDKxUUsa/bs4Mg4OnzHlgCQYnl6qzv98krkGrQd1P+W
	2yG0KOUVMEwXpZKYfwjreLfzZl3kTg2KxM2LtRd0Ufx86pEthu7NYrdrYPrWOj2qq/V1
	Mb1RmmonWPhvMzsdwo/nn86N3QJwGJRLy8rHk=
MIME-Version: 1.0
Received: by 10.90.114.8 with SMTP id m8mr681037agc.132.1283926787303; Tue, 07
	Sep 2010 23:19:47 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Tue, 7 Sep 2010 23:19:47 -0700 (PDT)
In-Reply-To: <AANLkTimo0OrOhiMDdPzb3tMKObru0H+iy_aS2EL_HG-C@mail.gmail.com>
References: <AANLkTikDDfWBM=VfC_XBzkp+-ZMycJ6kqkS56=_O6xW4@mail.gmail.com>
	<AANLkTi=jLFN8N+R7wh27ZE1hqoktiibGhO1-LuS-KOZy@mail.gmail.com>
	<AANLkTimo0OrOhiMDdPzb3tMKObru0H+iy_aS2EL_HG-C@mail.gmail.com>
Date: Wed, 8 Sep 2010 08:19:47 +0200
Message-ID: <AANLkTimY-gUUqZGP3-EQgjmYHmUN5TK9L4KLoZ+FvY89@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
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
X-List-Received-Date: Wed, 08 Sep 2010 06:20:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/7 Cliff Brake <cliff.brake@gmail.com>:
> On Sat, Sep 4, 2010 at 3:43 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> 2010/9/3 Cliff Brake <cliff.brake@gmail.com>:
>>
>>>
>>> Our immediate financial need is to upgrade storage on our server hardwa=
re:
>>>
>>> 4 new 1.5TB drives. Approx $1k
>>
>> Maybe before we spent 1k on disks:
>>
>> How much diskspace do we have now?
>> How much of it is used?
>> And what stored is on it?
>> And why is this massive amount of storage (4.5 TB assuming they are in
>> RAID5) needed?
>>
>> I feel 1k is a big amount for a small e.V. like ours, and before
>> deciding on the spending of it we should probably first discuss the
>> issue and evaluate other options.
>> E.g. maybe we can find a sponsor to donate some space and bandwidth on
>> their server.
>
> We share hardware and hosting costs with a number of other projects like:
>
> foonas.org
> nslu2-linux.org
> openwiz.org
> preware.org
> webos-internals.org
>
> Historically, we have funded very little of the server costs at the
> OSUOSL site. =A0I personally purchased a CPU for them at one point, and
> I'm not sure much else has come from the OE project. =A0So from a
> project standpoint, we are likely behind when it comes to paying for
> our share of the hardware costs.
>
> The 4.5TB will likely be shared with all the above projects. =A0The
> http://wiki.openembedded.net/index.php/Infrastructure page lists some
> of the resources allocated specifically to the OE project. =A0Other
> resources (such as a dedicated database server, and backups) are not
> so apparent.
>
> So in summary, we should fund at least a portion of the above storage
> costs. =A0Personally, I'm satisfied with how things are OSUOSL are run
> -- Tom King and others spend a lot of volunteer time keeping things
> running.
>
> Thanks,
> Cliff
>

Cliff, all,

Please note that I am not against paying our part of the resources.
The 4.5 TB request to me came as kind-of  a surprise as I don't see us
using up that amount of resources (as we currently have 50 GB).
But ofc as we also use CPU cycles, space, etc etc, so I see no problem
with us donating some storage hardware as we also use resources
donated by others.

Wrt OSUOSL: I see the people are doing a good job, and I really appreciate =
it.

Best regards, Frans


