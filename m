Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (unknown [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 4FA5F6059B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 May 2014 15:20:04 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Wimah-00038v-MG for openembedded-devel@lists.openembedded.org;
	Fri, 09 May 2014 17:20:03 +0200
Received: from 80-218-32-173.dclient.hispeed.ch ([80.218.32.173])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 May 2014 17:20:03 +0200
Received: from auslands-kv by 80-218-32-173.dclient.hispeed.ch with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 May 2014 17:20:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Neuer User <auslands-kv@gmx.de>
Date: Fri, 09 May 2014 17:19:36 +0200
Message-ID: <536CF208.3000400@gmx.de>
References: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
	<CAJTo0LZ_S=mNgM6gtPSfYf=AVRxdLcJ_CO31c+emmQrib80hjw@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: 80-218-32-173.dclient.hispeed.ch
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
In-Reply-To: <CAJTo0LZ_S=mNgM6gtPSfYf=AVRxdLcJ_CO31c+emmQrib80hjw@mail.gmail.com>
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: GStreamer 0.10's future
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
X-List-Received-Date: Fri, 09 May 2014 15:20:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 08.05.2014 17:54, schrieb Burton, Ross:
> On 8 May 2014 15:48, Burton, Ross <ross.burton@intel.com> wrote:
>> For the 1.7 release I want to move GStreamer 0.10 from oe-core into
>> meta-multimedia, and ensure everything in oe-core has ported to
>> GStreamer 1.x.  GStreamer 0.10 is considered dead upstream and is
>> unmaintained so we don't need to be shipping both versions anymore.
> 
> So the catch here is that Qt4 currently depends on GStreamer 0.10.
> 
Yes, it does, as long as you need QtMultimedia. Same applies to Qt5.
There was a discussion on the Qt mailing list about moving to
gstreamer1.0, but this seems to be rather some time in the future was my
impression.

> Can someone who doesn't come out in a rash when looking at C++ code
> spend two minutes to tell if me Qt4 supports GStreamer 1.0 (unlikely)
> and whether we can make GStreamer 0.10 support a build-time
> configuration and simply disable it in oe-core.
> 
> Ross
> 



