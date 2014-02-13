Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 1A7706E9F9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2014 17:01:09 +0000 (UTC)
Received: (qmail 12412 invoked by uid 1003); 13 Feb 2014 17:01:09 -0000
Received: from unknown (HELO ?192.168.1.122?)
	(philip@opensdr.com@71.171.41.155)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	13 Feb 2014 17:01:08 -0000
Message-ID: <52FCFA41.5050002@balister.org>
Date: Thu, 13 Feb 2014 12:00:49 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <52FCA09E.1070507@pseudoterminal.org>
In-Reply-To: <52FCA09E.1070507@pseudoterminal.org>
X-Enigmail-Version: 1.6
Subject: Re: OE and SSDs
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
X-List-Received-Date: Thu, 13 Feb 2014 17:01:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/13/2014 05:38 AM, Carlos Rafael Giani wrote:
> Hello,
> 
> we are considering purchasing SSDs for our development machines, for
> faster I/O and better latency. One open question is whether to buy TLC-
> or MLC-based drives. TLCs are considerably cheaper. They would not be
> used in build bots, but on the other hand, people will build entire
> images with OE by themselves during development.
> 
> So I wonder about the impact on the drive's lifespan, and whether or not
> it is severe enough to warrant the more expensive MLC drives (up to 2
> times more expensive).
> 
> Did anybody made experiences with these? Any recommendations?

A lot of people use as much ram as they can fit in the box and use
tmpfs'. You might try that approach first.

Philip

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 

