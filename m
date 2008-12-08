Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L9nNL-0004nP-P3
	for openembedded-devel@openembedded.org; Mon, 08 Dec 2008 22:10:43 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L9nJU-0008LB-SJ
	for openembedded-devel@openembedded.org; Mon, 08 Dec 2008 21:06:44 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 08 Dec 2008 21:06:44 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 08 Dec 2008 21:06:44 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 08 Dec 2008 22:06:34 +0100
Message-ID: <ghk28q$3na$1@ger.gmane.org>
References: <c384c5ea0812081135l44781a3fw1a43dba861a44f0f@mail.gmail.com>	<ghjvfm$opa$2@ger.gmane.org>
	<c384c5ea0812081258oda439dap33f989fb61354e4@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081130 Shredder/3.0b1pre
In-Reply-To: <c384c5ea0812081258oda439dap33f989fb61354e4@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: OE buildable on headless hosts?
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
X-List-Received-Date: Mon, 08 Dec 2008 21:10:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08-12-08 21:58, Leon Woestenberg wrote:
> Hello,
>
> On Mon, Dec 8, 2008 at 9:19 PM, Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>> On 08-12-08 20:35, Leon Woestenberg wrote:
>>> How many people are building GNOME/X stuff on non-X hosts (such as
>>> Ubuntu Server)?
>> Both my build machines are headless, but do have some x11 stuff installed.
>>
> You are correct and I should have changed the subject.
>
> I have started to fix some issues locally, but run from one problem
> into the other, not quite sure if they are all host-deps...
>
> http://bugs.openembedded.net/show_bug.cgi?id=4916

We should indeed try to weed out most dependencies on host system packages.

regards,

Koen



