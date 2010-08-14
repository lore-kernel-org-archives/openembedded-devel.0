Received: from asmtpout024.mac.com ([17.148.16.99])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1OkNz2-0001W8-V8
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 23:09:57 +0200
MIME-version: 1.0
Received: from [192.168.1.101] ([87.201.169.197])
	by asmtp024.mac.com (Sun Java(tm) System Messaging Server 6.3-8.01
	(built Dec
	16 2008; 32bit)) with ESMTPSA id <0L75002LLUQEWY70@asmtp024.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	14 Aug 2010 14:08:42 -0700 (PDT)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 phishscore=0 bulkscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx engine=6.0.2-1004200000 definitions=main-1008140162
X-Proofpoint-Virus-Version: vendor=fsecure
	engine=2.50.10432:5.0.10011,1.0.148,0.0.0000
	definitions=2010-08-14_07:2010-08-14, 2010-08-14,
	1970-01-01 signatures=0
From: Elvis Dowson <elvis.dowson@mac.com>
Date: Sun, 15 Aug 2010 01:08:32 +0400
In-reply-to: <4C66EB00.7050306@balister.org>
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=gYuoD-3RO=c5GpEbOZoHsAJOijrXXGnzcdNe9@mail.gmail.com>
	<AANLkTim_u5O3bLgdLiwE4fPCnbjRoUY1+Pad9iB8qXPW@mail.gmail.com>
	<4C66EB00.7050306@balister.org>
Message-id: <78B7E1F8-0655-44B0-B510-FA876835EF8F@mac.com>
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 17.148.16.99
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: What to do about the poor bitbake Quality Control?
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
X-List-Received-Date: Sat, 14 Aug 2010 21:09:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT

Hi,

On Aug 14, 2010, at 11:14 PM, Philip Balister wrote:

> On 08/14/2010 12:01 PM, Frans Meulenbroeks wrote:
>> 2010/8/14 AJ ONeal<coolaj86@gmail.com>:
>>> This is about the 4th time that I've `rm -rf`-d everything and started from
>>> scratch and never yet got a working `bitbake omap3-console-image`
>>> 
>>> Every time I `git pull` it's a different set of problems. It's never the
>>> same package twice, but they never all compile for the basic console image
>>> anywhere from 4 to 20 hours in.
>>> 

> I think they are building from the gumstix overo repo. We are interested in failures (at least failures for recipes that are in .dev), but we can't guarantee when our fixes will hit the gumstix repository.

The overo-oe repository setup instructions pull from a gitorious branch, that is based on the oe development branch. I too have faced these issues everytime. It really is a pain, one can never be sure if the overo-oe repo will compile reliably after a git pull. Its a total waste of time. 

Elvis Dowson

