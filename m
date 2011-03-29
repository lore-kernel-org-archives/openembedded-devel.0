Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1Q4dZ1-0005I6-KE
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 20:22:48 +0200
Received: by iwn10 with SMTP id 10so443911iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2011 11:20:48 -0700 (PDT)
Received: by 10.231.207.1 with SMTP id fw1mr216489ibb.8.1301422848302; Tue, 29
	Mar 2011 11:20:48 -0700 (PDT)
MIME-Version: 1.0
Sender: jay@jay-tech.ru
Received: by 10.231.34.130 with HTTP; Tue, 29 Mar 2011 11:20:28 -0700 (PDT)
X-Originating-IP: [95.29.13.198]
In-Reply-To: <imt6b8$ktl$1@dough.gmane.org>
References: <E1Q3y4q-00047f-Ns@melo.openembedded.org>
	<20110328083149.GA7337@xora-eee.xora.org.uk>
	<AANLkTikP801Wp0c2BVr+9EQ5S0yfrzO8ONa7V3cU1BCp@mail.gmail.com>
	<imt6b8$ktl$1@dough.gmane.org>
From: Yury Bushmelev <jay4mail@gmail.com>
Date: Tue, 29 Mar 2011 22:20:28 +0400
X-Google-Sender-Auth: ZVFN9eD1n5vVhsMGVUzlWi0pbHQ
Message-ID: <BANLkTikeuv7W-3YMNJjAO7_7YR2SY0twKQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Andrea Adami : udev: remove udev-compat for Zaurus devices since we use 2.6 .38 finally.
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
X-List-Received-Date: Tue, 29 Mar 2011 18:22:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/3/29 Koen Kooi <koen@dominion.thruhere.net>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 28-03-11 11:00, Andrea Adami wrote:
>> On Mon, Mar 28, 2011 at 10:31 AM, Graeme Gregory <dp@xora.org.uk> wrote:
>>> Shouldnt this patch have a PR bump so udev already on devices is updated?
>>>
>>> Graeme
>>
>> Ah, yes ...if we only had working images on devices ;)
>> IIRC udev-compat was not accepted in Narcissus.
>
> That's because noone wants to support zaurus devices in angstrom, only
> bitch about them being unsupported.

s/ in angstrom// :(

-- 
Yury Bushmelev


