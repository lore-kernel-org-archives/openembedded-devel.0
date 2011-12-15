Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1Rb53Q-00087z-Oa
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 07:44:32 +0100
Received: by eekb15 with SMTP id b15so1499536eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2011 22:37:35 -0800 (PST)
Received: by 10.14.48.66 with SMTP id u42mr793653eeb.59.1323931054748;
	Wed, 14 Dec 2011 22:37:34 -0800 (PST)
Received: from [217.197.84.226] (recycler.in-berlin.de. [217.197.84.226])
	by mx.google.com with ESMTPS id 54sm20168525eeo.10.2011.12.14.22.37.33
	(version=SSLv3 cipher=OTHER); Wed, 14 Dec 2011 22:37:33 -0800 (PST)
Message-ID: <4EE995AB.5090503@dresearch-fe.de>
Date: Thu, 15 Dec 2011 07:37:31 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Tom Rini <tom.rini@gmail.com>
References: <cover.1323862499.git.sledz@dresearch-fe.de>
	<CA+M6bXk57+wbvAzkLrZVDPCvhGFLH8A-A3ESNnW_-Yk=TiDfLw@mail.gmail.com>
In-Reply-To: <CA+M6bXk57+wbvAzkLrZVDPCvhGFLH8A-A3ESNnW_-Yk=TiDfLw@mail.gmail.com>
Cc: Steffen Sledz <sledz@dresearch.de>,
	openembedded-devel@lists.openembedded.org,
	Stefan Schmidt <stefan@buglabs.net>
Subject: Re: [2011.03-maintenance 0/5] pull request 20111214
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
X-List-Received-Date: Thu, 15 Dec 2011 06:44:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Am 14.12.2011 19:07, schrieb Tom Rini:
> On Wed, Dec 14, 2011 at 4:40 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
>> Hi Tom,
>>
>> please pull these 5 commits cherry-picked from oe.dev.
>> All of them are bugfixes and tested in our own environment.
>>
>> Thx,
>> Steffen
>>
>> The following changes since commit 9826895e30baa597a5ec433cc0ebd52f5f6c8796:
>>
>>  Merge remote-tracking branch 'upstream/2011.03-maintenance' into sledz/maintenance (2011-12-09 14:06:08 +0100)
>>
>> are available in the git repository at:
>>
>>  git://git.openembedded.org/openembedded sledz/maintenance
>>  http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=sledz/maintenance
>>
>> Stefan Schmidt (2):
>>  llvm2.7_2.7: Add patch for build errors on newer gcc / glibc
>>    combinations
>>  llvm2.7_2.7.bb: Update patch to use c++ include style.
>>
>> Steffen Sledz (3):
>>  live555: replace version 20110314 with 20111120
>>  icedtea6-native: fix problem on build hosts with linux kernel 3.x
>>  openjdk: fix problem on build hosts with linux kernel 3.x
> 
> Only 1 2 and 3 made it to the ML.

Please have a second look. They all should be there.

> 1 and 2 are fine.  For 3, we should
> grab the old file (someone must have a copy) and stick that on
> sources.openembedded.org.

The version replacement is not just for the well known live555 download problem. It fixes some other problems too. Also the version introduced by this patch is already uploaded to sources.openembedded.org and the angstrom mirrors.

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


