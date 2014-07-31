Return-Path: <pandey_himanshu80@rediffmail.com>
Received: from f4mail-83-115.rediffmail.com (unknown [203.199.83.115])
	by mail.openembedded.org (Postfix) with ESMTP id D88C17089F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 06:41:53 +0000 (UTC)
Received: from rediffmail.com (unknown [10.50.250.70])
	by f4mail-83-114.rediffmail.com (Postfix) with SMTP id 8FEEE3083774
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 11:59:09 +0530 (IST)
Received: (qmail 5333 invoked by uid 510); 31 Jul 2014 06:39:36 -0000
Comment: DomainKeys? See http://antispam.yahoo.com/domainkeys
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=redf; d=rediffmail.com;
	b=qLcYwIuwLgEXA9imbk2AQSNUjic2MPDydrK9eIiz0KVVBZOhjEgfNsfyjaqJADu6C9Pk00dPAKw2XtVfhSv5s188iJ7YPrXPkDk7us27QoqO1rHp2ffjavNPXOfNk5IJbjp+z+FGAPuL+h+u7Cz87UN5UnXtVL2xKU+Uu1WPDDw=
	; 
x-m-msg: asd54ad564ad7aa6sd5as6d5; a6da7d6asas6dasd77; 5dad65ad5sd;
X-CTCH-Spam: Unknown
X-CTCH-VOD: Unknown
X-CTCH-Flags: : 0
X-CTCH-RefID: str=0001.0A160208.53D9E4A9.018A, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-REDF-OSEN: pandey_himanshu80@rediffmail.com
Date: 31 Jul 2014 06:39:36 -0000
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Received: from unknown 103.25.205.2 by rediffmail.com via HTTP;
	31 Jul 2014 06:39:36 -0000
Message-ID: <1406788373.S.49300.autosave.drafts.old.1406788776.5264@webmail.rediffmail.com>
Sender: pandey_himanshu80@rediffmail.com
From: "Himanshu  Pandey" <pandey_himanshu80@rediffmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Regarding DHCP
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
X-List-Received-Date: Thu, 31 Jul 2014 06:42:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

I am compiling dhcp but getting the following error:

undefined reference to `dns_client_createx2'

Can somebody help me to resolve the issue?

Regards,
Himanshu


