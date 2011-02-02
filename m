Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1PkWtU-0002rn-Au
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Feb 2011 08:12:48 +0100
Received: by qwi2 with SMTP id 2so7402313qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Feb 2011 23:11:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.248.198 with SMTP id mh6mr7995993qcb.5.1296630707855; Tue,
	01 Feb 2011 23:11:47 -0800 (PST)
Sender: jay@jay-tech.ru
Received: by 10.220.193.9 with HTTP; Tue, 1 Feb 2011 23:11:47 -0800 (PST)
X-Originating-IP: [93.81.3.94]
In-Reply-To: <4D4901B1.2040704@dresearch.de>
References: <1296508073.20792.4.camel@mattotaupa>
	<4D4901B1.2040704@dresearch.de>
Date: Wed, 2 Feb 2011 10:11:47 +0300
X-Google-Sender-Auth: 55ag5gUAl1GIiHhgx5Pk_XJllcA
Message-ID: <AANLkTimWaTzr5hz3-sw39e_rBSkpGEuhQJyOeEoh2kbt@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: <http://openembedded.{org, net}/> redirect to <http://bugs.openembedded.net/>
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
X-List-Received-Date: Wed, 02 Feb 2011 07:12:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/2/2 Steffen Sledz <sledz@dresearch.de>:
> Am 31.01.2011 22:07, schrieb Paul Menzel:
>> Dear administrators,
>>
>> I just wanted to inform you, that <http://openembedded.{org,net}/>
>> redirect to <http://bugs.openembedded.net/>.
>>
>> <http://www.openembedded.org/> redirects to the Wiki setup which is what
>> I would suspect.
>
> This seems to be fixed.
>
> But now http://tinderbox.openembedded.{org,net} redirects to the wiki too. So the build results are no longer available. :(

OE-stats is disabled administratively. It produces very high mysql
load which is killing other projects at OSUOSL. We are investigating
(slowly :( ).

-- 
Yury Bushmelev


