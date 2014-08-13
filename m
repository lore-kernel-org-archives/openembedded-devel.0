Return-Path: <pandey_himanshu80@rediffmail.com>
Received: from rediffmail.com (unknown [202.137.235.239])
	by mail.openembedded.org (Postfix) with SMTP id 9376065D54
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Aug 2014 04:57:53 +0000 (UTC)
Received: (qmail 6087 invoked by uid 510); 13 Aug 2014 04:57:47 -0000
Comment: DomainKeys? See http://antispam.yahoo.com/domainkeys
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=redf; d=rediffmail.com;
	b=SQ1Y7F/x1qLms/tOUOnH78KZzi9+BBrRX45M/44e/VD2febO6XQ42b5k5bJhQdwCENJWRkWgmX1IuLkNVKaBaNRZbk4FTLUR9E/cp0X1Om8ESP2Lk7tkCNDmiLYvzeMLBbDxkU8qA38baoptIU4yEsfuMgOXNFUPgH3R7RIXa5A=
	; 
x-m-msg: asd54ad564ad7aa6sd5as6d5; a6da7d6asas6dasd77; 5dad65ad5sd;
X-CTCH-Spam: Unknown
X-CTCH-VOD: Unknown
X-CTCH-Flags: : 0
X-CTCH-RefID: str=0001.0A160204.53EAF04A.0289, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-REDF-OSEN: pandey_himanshu80@rediffmail.com
Date: 13 Aug 2014 04:57:46 -0000
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Received: from unknown 103.25.205.2 by rediffmail.com via HTTP;
	13 Aug 2014 04:57:46 -0000
Message-ID: <1407840950.S.69623.autosave.drafts.old.1407905866.6016@webmail.rediffmail.com>
Sender: pandey_himanshu80@rediffmail.com
From: "Himanshu  Pandey" <pandey_himanshu80@rediffmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Regarding PR flag
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
X-List-Received-Date: Wed, 13 Aug 2014 04:57:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,
How to bump up PR flag automatically. The problem is that every time I clean and compile my image, some of the .bb files are not compiled, then in that case I bump their PR by 1 and then they get compiled. So I want to avoid this situation. I want that every time I do clean &amp; compile all the packages shall be compiled without any problem.
Please help.
Regards,Himanshu

