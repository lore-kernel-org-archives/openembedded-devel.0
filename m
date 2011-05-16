Received: from 10.26.mail-out.ovh.net ([46.105.47.155]
	helo=26.mail-out.ovh.net) by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QLxyZ-0007nR-PR
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 15:36:47 +0200
Received: (qmail 16002 invoked by uid 503); 16 May 2011 13:00:05 -0000
Received: from b6.ovh.net (HELO mail94.ha.ovh.net) (213.186.33.56)
	by 26.mail-out.ovh.net with SMTP; 16 May 2011 13:00:05 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 16 May 2011 15:33:40 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 16 May 2011 15:33:39 +0200
Message-ID: <4DD127B3.2070008@eukrea.com>
Date: Mon, 16 May 2011 15:33:39 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1305541323-19773-1-git-send-email-sgh@sgh.dk>
	<02AB4574-909D-46A2-98E2-585E7A72BEE5@vanille-media.de>
In-Reply-To: <02AB4574-909D-46A2-98E2-585E7A72BEE5@vanille-media.de>
X-Ovh-Tracer-Id: 2860630189999238473
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH 3/3] angstrom: Prefer Qt 4.7.3
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
X-List-Received-Date: Mon, 16 May 2011 13:36:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mickey,

On 16/05/2011 13:38, Dr. Michael Lauer wrote:
> I reckon you tested Qt 4.7.3 with PyQt before deleting 4.7.2...

ok pyqt is no more fetchable. I upgraded it (and sip) and both compile fine 
for armv5 using qt 4.7.3. The patches are following.

Eric


