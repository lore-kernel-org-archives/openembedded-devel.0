Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LwyNv-0005MM-Mo
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 14:50:35 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LwyJT-0001jR-1n
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 12:45:59 +0000
Received: from iap-pxy-mow1.siemens.ru ([212.248.25.26])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 23 Apr 2009 12:45:59 +0000
Received: from dbaryshkov by iap-pxy-mow1.siemens.ru with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 23 Apr 2009 12:45:59 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Thu, 23 Apr 2009 12:45:49 +0000 (UTC)
Message-ID: <gspnts$2p3$2@ger.gmane.org>
References: <gspjtp$2p3$1@ger.gmane.org> <49F0557D.4080009@xora.org.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: iap-pxy-mow1.siemens.ru
User-Agent: Pan/0.132 (Waxed in Black)
Sender: news <news@ger.gmane.org>
Subject: Re: kexec-tools-static question
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
X-List-Received-Date: Thu, 23 Apr 2009 12:50:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Graeme Gregory wrote:

> On 04/23/2009 12:37 PM, Dmitry Eremin-Solenikov wrote:
>> Hi,
>>
>> I've stumbled upon kexec-tools/kexec-tools-static package. Currently
>> it's packaged inside generic feed (e.g. armv5te in my case). However it
>> uses kernel headers and klibc which are machine-specific IIRC.
>> Shouldn't kexec-tools-static be built with PACKAGE_ARCH =
>> "${MACHINE_ARCH}" instead?
>>
>> As a side note: kexec-tools-static fails to build for tosa as the
>> staged 2.6.29 kernel doesn't contain machine-specific headers (will
>> look at it soon).
>>
>>
> Look back in the mailing list archives, this is/has been/being discussed
> already!

Hmm. That was discussed in the first days of April and we are now facing May.
In that thread you said that your patches are not finished. Did you have time
to finish them so that they can be commited?

-- 
With best wishes
Dmitry




