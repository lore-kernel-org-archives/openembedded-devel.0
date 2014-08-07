Return-Path: <pandey_himanshu80@rediffmail.com>
Received: from rediffmail.com (unknown [202.137.235.241])
	by mail.openembedded.org (Postfix) with SMTP id 9EBB460017
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Aug 2014 07:27:25 +0000 (UTC)
Received: (qmail 10997 invoked by uid 510); 7 Aug 2014 07:27:17 -0000
Comment: DomainKeys? See http://antispam.yahoo.com/domainkeys
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=redf; d=rediffmail.com;
	b=dmR1GdeN2uxOzQwwnb/kxdxNSTHBdsrqYZIG0jNuO4tom44mF+sRKb3IDy+zTSUyGXdATG3jtXchBikfBrnqNzTcARNBlbkNtPZzfc/iqBECxjQGNro7pUM1Bn71vuegajfJgSIM0BToZkX5/UAO7MIiYo64MKTAVv2FwXgNybc=
	; 
x-m-msg: asd54ad564ad7aa6sd5as6d5; a6da7d6asas6dasd77; 5dad65ad5sd;
X-CTCH-Spam: Unknown
X-CTCH-VOD: Unknown
X-CTCH-Flags: : 0
X-CTCH-RefID: str=0001.0A160205.53E32A54.0142, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-REDF-OSEN: pandey_himanshu80@rediffmail.com
Date: 7 Aug 2014 07:27:16 -0000
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Received: from unknown 103.25.205.2 by rediffmail.com via HTTP;
	07 Aug 2014 07:27:16 -0000
Message-ID: <1407392957.S.4034.3008.F.H.TmZ1cGFuAFtvZV0ganVzdCBhIHRlc3Q_.RU.rfs305,
	rfs305, 103,
	131.f4-234-118.old.1407396436.10715@webmail.rediffmail.com>
Sender: pandey_himanshu80@rediffmail.com
From: "Himanshu  Pandey" <pandey_himanshu80@rediffmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Problem with YOCTO
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
X-List-Received-Date: Thu, 07 Aug 2014 07:27:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

I have an issue with Yocto:

Suppose I am compiling a package say X that has a dependency on package Y and Z. Now in my receipe I have included Y and Z with DEPENDS flag. So as far as I know first Y &amp; Z will be compiled and installed and then X will be compiled. But unfortunately that is not happening in my case &amp; I don't understand why? 

For every dependent package I have to manually compile and install it's dependencies then only my package gets compiled. This is the biggest issue I am facing with YOCTO.

Please somebody help me to resolve this issue.&nbsp; 

Regards,
Himanshu

From: fupan &lt;fupan.li@windriver.com&gt;
Sent: Thu, 07 Aug 2014 11:59:17 
To: &lt;openembedded-devel@lists.openembedded.org&gt;
Subject: [oe] just a test


-- 

_______________________________________________

Openembedded-devel mailing list

Openembedded-devel@lists.openembedded.org

http://lists.openembedded.org/mailman/listinfo/openembedded-devel


