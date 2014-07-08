Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id E3DE170196
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jul 2014 16:11:33 +0000 (UTC)
Received: (qmail 7089 invoked by uid 1003); 8 Jul 2014 16:11:33 -0000
Received: from unknown (HELO ?192.168.1.122?) (philip@opensdr.com@108.44.80.46)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	8 Jul 2014 16:11:33 -0000
Message-ID: <53BC1835.90204@balister.org>
Date: Tue, 08 Jul 2014 12:11:33 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAD2C2VT=3DipX=8chChc6_NefZSfs3jocmYxePJp5THxANiKVg@mail.gmail.com>
In-Reply-To: <CAD2C2VT=3DipX=8chChc6_NefZSfs3jocmYxePJp5THxANiKVg@mail.gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: open embedded build issues with beagle board
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jul 2014 16:11:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 07/08/2014 02:54 AM, Bryan wrote:
> Hi All
>  I am trying to build  Openembeeded classic for Beagle board-XM but i am
> getting lot of broken link issues. I have  set DISTRO as angstrom-2010.x in
> local.conf.   Is this approach  ok? or should i move to openembedded core ??
> Pls suggest.

Use the current Angstrom instructions, oe-classic is pretty much
completely unsupported now.

Philip

> 
> Broken link e.g.
> 
> Resolving www.angstrom-distribution.org (www.angstrom-distribution.org)...
> 140.211.169.177
>  Connecting to www.angstrom-distribution.org
> (www.angstrom-distribution.org)|140.211.169.177|:80...
> connected.
>  HTTP request sent, awaiting response...
> 404 Not Found  2014-07-08 10:13:43 ERROR 404: Not Found.
> 
> Thanks in advance
> 

