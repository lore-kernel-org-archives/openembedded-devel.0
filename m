Received: from [209.85.198.190] (helo=rv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <xjqian@gmail.com>) id 1JKqqx-0002Es-Vv
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Feb 2008 09:02:28 +0100
Received: by rv-out-0910.google.com with SMTP id c24so758047rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Feb 2008 00:02:35 -0800 (PST)
Received: by 10.140.191.14 with SMTP id o14mr2288652rvf.78.1201852955440;
	Fri, 01 Feb 2008 00:02:35 -0800 (PST)
Received: from ?192.168.1.207? ( [24.107.189.117])
	by mx.google.com with ESMTPS id g3sm4818180wra.7.2008.02.01.00.02.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 01 Feb 2008 00:02:34 -0800 (PST)
Message-ID: <47A2D217.7070000@gmail.com>
Date: Fri, 01 Feb 2008 02:02:31 -0600
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1201544344.5882.45.camel@hammer.suse.cz>	<20080130124544.1f562944@widy.localdomain>
	<1201695196.27523.52.camel@hammer.suse.cz>
In-Reply-To: <1201695196.27523.52.camel@hammer.suse.cz>
Subject: Re: [patch commit request] kdrive xserver: support for	key	codes 128-255
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2008 08:02:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/30/2008 06:13 AM, Stanislav Brabec wrote:
>> Paul Sokolovsky wrote:
>> Can you please elaborate what the application of this patch would mean
>> for OE (besides fixing support for one specific obscure peripheral)? 

I guess I probably would be yelled at for not raising this before 
committing your patch.

Is this patch specific to Zaurus clamshells, akita/spitz/c7x0? In other 
words, are there any other devices benifiting from the extended keycode. 
  I vaguely remember Dmitry asked about extended keycode for tosa, but 
I'm not sure he's talking about the same thing.

Regards
Gordon



