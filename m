Received: from [64.233.166.179] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <xjqian@gmail.com>) id 1I20WC-0004vK-2z
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jun 2007 09:58:52 +0200
Received: by py-out-1112.google.com with SMTP id a25so655790pyi
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jun 2007 00:54:52 -0700 (PDT)
Received: by 10.35.90.1 with SMTP id s1mr4027231pyl.1182585292455;
	Sat, 23 Jun 2007 00:54:52 -0700 (PDT)
Received: from ?192.168.1.204? ( [24.107.186.86])
	by mx.google.com with ESMTP id 7sm13915218nzn.2007.06.23.00.54.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 23 Jun 2007 00:54:51 -0700 (PDT)
Message-ID: <467CD0DA.7020104@gmail.com>
Date: Sat, 23 Jun 2007 02:50:50 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Icedove 1.5.0.10 (X11/20070329)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20070621070815.E3274402068@tinman.treke.net>
In-Reply-To: <20070621070815.E3274402068@tinman.treke.net>
Subject: Re: [oe-issues] [Bug 2282] python_2.4.4 packaging QA issue
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
X-List-Received-Date: Sat, 23 Jun 2007 07:58:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Glad to see there is a solution forming on this QA issue.

Btw, I'm taking unexpectedly trips during the last two months. Sorry for 
not getting anything done in my small plate.

Gordon
 
> --- Comment #5 from Koen Kooi <koen@dominion.kabel.utwente.nl>  2007-06-21 00:08:15 ---
> (In reply to comment #4)
>   
>> unpackaged files are now shipped -- thanks for the input.
>>
>> I agree though that it would be very handy to have a "collect everything
>> .debug" task -- since this is not related to Python, please open up another bug
>> entry where we can discuss this feature request.
>>     
>
> If I may hijack this bug for a moment :)
>
> Richard and I had a talk about it, and Richard proposed to copy files when
> packaging instead of moving them, which would make it easier to remove all
> debug files from non-debug packages.


