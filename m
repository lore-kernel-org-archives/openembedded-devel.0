Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1Nrq9H-0006mR-Iw
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 11:06:53 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id o2HA3hiQ029556
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Mar 2010 11:03:43 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.69) (envelope-from <ensc@sigma-chemnitz.de>) id 1Nrq6J-0006f3-Dj
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 11:03:43 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <ac9c93b11002281139g6963e753w970c97002611c78c@mail.gmail.com>
	<1267392928.13054.1.camel@andromeda> <hmgjc2$sgd$1@dough.gmane.org>
	<BE689342-3D28-4D8F-A58C-36885368CE0F@vanille-media.de>
	<20100301150245.GC12022@jama>
	<ly634xpm2z.fsf_-_@ensc-virt.intern.sigma-chemnitz.de>
	<20100317084820.GI29306@jama>
Date: Wed, 17 Mar 2010 11:03:43 +0100
In-Reply-To: <20100317084820.GI29306@jama> (Martin Jansa's message of "Wed, 17
	Mar 2010 09:48:20 +0100")
Message-ID: <lyk4tbjmdc.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.67 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake -b with BBCLASSEXTENDed recipes
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
X-List-Received-Date: Wed, 17 Mar 2010 10:06:53 -0000
Content-Type: text/plain; charset=us-ascii

Martin Jansa <martin.jansa@gmail.com> writes:

>> > Is it possible to implement some support for old functionality like
>> > bitbake -c clean -b path.to.recipe.with.BBCLASSEXTEND.bb
>> > ...
>> > It's really hard to implement something like prefixing -b path with
>> > "virtual:native:"
>> 
>> Bitbake must be patched for this; see
>> https://www.cvg.de/people/ensc/0008-bbclassextend.patch
>
> Ahh, great! Thanks for working on this, can you rebase it for bitbake
> master? 

Yes; I will work on it.  But it won't happen before the weekend.



Enrico


