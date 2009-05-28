Received: from [209.85.220.220] (helo=mail-fx0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <castroenrico@gmail.com>) id 1M9hTN-0000Fu-U4
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 May 2009 17:24:49 +0200
Received: by fxm20 with SMTP id 20so5463944fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2009 08:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=p2X5d6a0TMf++YVGRPvXt8ml3271o8b8vwQUg8lm45w=;
	b=FlodbfP5DlkiFYGzZX4dt9/3U0s7nKnZ3Gvz9PHbloD86R8VaCM1GGzGUEgdz+lW7G
	WRnr3WHM5Cbd9ZjIfkzJ4s9br+2oIy/AIPetI/zFguKHf0OvAwzk3/aLJCgfvmA5Lg7H
	xKSWWWKUrJSOHfPSnbJ4jS1CdPCW6tFh09rQM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=I4fdwNCb094g1ihFnLkT4y6ugxXU96k4F4AboqnxuilxINOMbM+i6KGR0FEi0mjKdf
	PHa8tpocQfZ3qP1H1xKvdYyb4vSJdh8Ii5ct4PJ4qWh7CVuoWD1FOrdg/Q73oylpugds
	HWE6hpegRBezEEAz9/q9eYEqjfFbioqExk30g=
Received: by 10.103.248.17 with SMTP id a17mr865001mus.97.1243523788369;
	Thu, 28 May 2009 08:16:28 -0700 (PDT)
Received: from ubuntu.redarrow (net-93-144-7-97.t2.dsl.vodafone.it
	[93.144.7.97])
	by mx.google.com with ESMTPS id t10sm287984muh.0.2009.05.28.08.16.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 28 May 2009 08:16:26 -0700 (PDT)
Message-ID: <4A1EAAC8.8010700@gmail.com>
Date: Thu, 28 May 2009 17:16:24 +0200
From: Enrico Castro <castroenrico@gmail.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A1D5B1F.4060608@gmail.com> <4A1D5C7B.9010504@balister.org>
In-Reply-To: <4A1D5C7B.9010504@balister.org>
Subject: Re: ti-codec-engine_2.23.bb failed
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
X-List-Received-Date: Thu, 28 May 2009 15:24:50 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Thank for your immediately reply. Can I follow this steps[1]?

Regards,

Enrico

[1] https://gstreamer.ti.com/gf/project/gstreamer_ti/wiki/?pagename=BuildingWithAngstrom

Philip Balister wrote:
> Enrico Castro wrote:
>> I build ti-codec-engine_2.23.bb, but the source 
>> codec_engine_2_23_01.tar.gz did not found in 
>> www.angstrom-distribution.org
> 
> You need to read the instructions in the bb file. You will need an 
> account on the TI website and download the source yourself. You will 
> also need to download the DSP toolchain.
> 
> Philip
> 
>>
>> NOTE: Running task 1786 of 5760 (ID: 475, 
>> /home/enrico/oe/openembedded/recipes/dsplink/ti-codec-engine_2.23.bb, 
>> do_fetch)
>> NOTE: fetch 
>> http://install.tarball.in.source.dir/codec_engine_2_23_01.tar.gz
>> --16:48:23--  
>> http://install.tarball.in.source.dir/codec_engine_2_23_01.tar.gz
>>            => `/home/enrico/oe/tmp/downloads/codec_engine_2_23_01.tar.gz'
>> Resolving install.tarball.in.source.dir... failed: Name or service not 
>> known.
>> NOTE: fetch 
>> http://www.angstrom-distribution.org/unstable/sources/codec_engine_2_23_01.tar.gz 
>>
>> --16:48:23--  
>> http://www.angstrom-distribution.org/unstable/sources/codec_engine_2_23_01.tar.gz 
>>
>>            => `/home/enrico/oe/tmp/downloads/codec_engine_2_23_01.tar.gz'
>> Resolving www.angstrom-distribution.org... 85.214.40.226
>> Connecting to www.angstrom-distribution.org|85.214.40.226|:80... 
>> connected.
>> HTTP request sent, awaiting response... 404 Not Found
>> 16:48:36 ERROR 404: Not Found.
>>
>> NOTE: Task failed: Fetch failed: 
>> http://install.tarball.in.source.dir/codec_engine_2_23_01.tar.gz
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of 
>> /home/enrico/oe/openembedded/recipes/dsplink/ti-codec-engine_2.23.bb 
>> do_fetch failed
>> ERROR: Task 475 
>> (/home/enrico/oe/openembedded/recipes/dsplink/ti-codec-engine_2.23.bb, 
>> do_fetch) failed
>> NOTE: Tasks Summary: Attempted 1785 tasks of which 1785 didn't need to 
>> be rerun and 1 failed.
>> ERROR: 
>> '/home/enrico/oe/openembedded/recipes/dsplink/ti-codec-engine_2.23.bb' 
>> failed
>>
>> Regards,
>>
>> Enrico
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



