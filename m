Return-Path: <prvs=675da3d15=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 6E1AF76536
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 06:59:39 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApsEAA8G4FWsEApK/2dsb2JhbABdhF7DHIJYAoIQAQEBAQEBgQuEJAEBBDIBRhALDQsJJQ8CRgYNAQcCiC/GIAEBAQEBBQEBAQEehm2EdYULBxeEFQEElT2OPYcuF4kgiDSEJ4I3gQUBAQE
X-IPAS-Result: ApsEAA8G4FWsEApK/2dsb2JhbABdhF7DHIJYAoIQAQEBAQEBgQuEJAEBBDIBRhALDQsJJQ8CRgYNAQcCiC/GIAEBAQEBBQEBAQEehm2EdYULBxeEFQEElT2OPYcuF4kgiDSEJ4I3gQUBAQE
Message-ID: <55E006B4.50103@skidata.com>
Date: Fri, 28 Aug 2015 08:59:00 +0200
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1A315F32-74AE-4B3B-A5B7-65A33C5A6BC7@gmail.com>
	<CAP9ODKrwYHeeUdcLCLm6Bsw26V4ypZA-kNDYoX=fA4bx_MYQ0Q@mail.gmail.com>
In-Reply-To: <CAP9ODKrwYHeeUdcLCLm6Bsw26V4ypZA-kNDYoX=fA4bx_MYQ0Q@mail.gmail.com>
X-Originating-IP: [172.16.60.30]
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: meta-java - recent commits break foreign (MY!) builds ...
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
X-List-Received-Date: Fri, 28 Aug 2015 06:59:42 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 08/27/2015 03:28 PM, Otavio Salvador wrote:
> 
> Yes, we need to fix it and to be honest I personally would kill
> openjdk 7 once 8 is ready.
> 
I think we should keep (and UPDATE!) openjdk 6 & 7 as long as they get
support from RedHat and therefore IcedTea. There may be users relying on
the old java version for their long-term-supported products (so do we)!

IMHO we should start with openjdk 6: remove the old versions and add the
latest (1.13.8)!

What do you think? Any comments?

regards,
Richard L

