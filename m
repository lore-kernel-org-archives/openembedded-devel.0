Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QXLu5-0003tM-PX
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Jun 2011 01:23:13 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QXLqi-0003zA-I5 from Tom_Rini@mentor.com ;
	Thu, 16 Jun 2011 16:19:44 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 16 Jun 2011 16:19:44 -0700
Received: from [172.30.80.132] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 16 Jun 2011 16:19:43 -0700
Message-ID: <4DFA8F80.3050101@mentor.com>
Date: Thu, 16 Jun 2011 16:19:28 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch-fe.de>
References: <4DF735B3.1020106@dresearch-fe.de>	<4DF767F9.3070500@dresearch-fe.de>
	<4DF77D33.7080407@mentor.com> <4DF8B96D.7090605@dresearch-fe.de>
In-Reply-To: <4DF8B96D.7090605@dresearch-fe.de>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 16 Jun 2011 23:19:44.0399 (UTC)
	FILETIME=[E06189F0:01CC2C7B]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] Pull request (resume)
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
X-List-Received-Date: Thu, 16 Jun 2011 23:23:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06/15/2011 06:53 AM, Steffen Sledz wrote:
> On 14.06.2011 17:24, Tom Rini wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 06/14/2011 06:54 AM, Steffen Sledz wrote:
>>> On 14.06.2011 12:19, Steffen Sledz wrote:
>>>> Please pull some commits from here:
>>>>
>>>> URI: git@git.openembedded.org:openembedded
>>>> Branch: sledz/maintenance
>>>>
>>>> Most commits are hipox machine specific. One allows building kernel
>>>> with newer GNU make. All are part of oe master.
>>>
>>> Please suspend this pull request!
>>
>> Noted, thanks.
> 
> OK, branch is ready for pulling now.

This is now applied, thanks!

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJN+o94AAoJEI4NMjfc3nJx1q0IANBE8/WYVzFlx/R6gj1aULP1
rJfGKtsaLr7jTIWlwn84VfT8Hau6dyDR9ld/zWYE/fmFHb76bZLBSTo5QQ3MZzY3
g6B+VyyjhbBtbakEsT6zGJThYsf59ef4sZHbQdVcjS9o/offbxQsDyInsvsDyWQc
Vl+G3fWS0SuAhwPDjQeO/C2AsXTFJW8w9ygiTwJLyOmiBBTCS/NGLGYH5JN5lVl9
DgQ9lm0AxtrBRafxTJxl1sxhqkAuOP3ff97bzOxe19qJMIM/0b2mOwYuWirrzN4c
ehvL1OTFwkXGatJ0k0QBJxhBeA0Xa9iJ4l5aFVFD7KiELa9IH5KdQ2aCIjT2DQk=
=yEHU
-----END PGP SIGNATURE-----


